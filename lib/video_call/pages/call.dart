import 'package:blue_app/res/colors.dart';
import 'package:blue_app/video_call/utils/setting.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key, this.channelName, this.clientRole});
  final String? channelName;
  final ClientRoleType? clientRole;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool mute = false;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();

    super.dispose();
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add("App ID is missing, Please provide App ID");
        _infoStrings.add("Agora Engine is not starting");
      });
      return;
    }
    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );
    _addAgoraEventHandler();
    _engine.setClientRole(role: widget.clientRole!);
    VideoEncoderConfiguration configuration = const VideoEncoderConfiguration();
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: widget.channelName!,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  void _addAgoraEventHandler() {
    _engine.registerEventHandler(
      // Handle different events during the video call
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            final info = "local user ${connection.localUid} joined";
            _infoStrings.add(info);
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() {
            final info = "remote user $remoteUid joined";
            _infoStrings.add(info);
            _users.add(remoteUid);
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          setState(() {
            final info = "remote user $remoteUid left channel";
            _infoStrings.add(info);
            _users.remove(remoteUid);
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );
  }

  Widget _viewRows() {
    final List<StatefulWidget> list = [];
    if (widget.clientRole == ClientRoleType.clientRoleBroadcaster) {
      list.add(AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: _engine,
          canvas: const VideoCanvas(uid: 0),
        ),
      ));
    }
    for (var uid in _users) {
      list.add(AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: uid),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      ));
    }
    final views = list;
    return Column(
      children:
          List.generate(views.length, (index) => Expanded(child: views[index])),
    );
  }

  Widget _toolbar() {
    // if (widget.clientRole == ClientRoleType.clientRoleAudience) {}
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: white,
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.videocam_off_outlined,
              color: purple,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                mute = !mute;
              });
              _engine.muteLocalAudioStream(mute);
            },
            shape: const CircleBorder(),
            fillColor: mute ? purple : white,
            padding: const EdgeInsets.all(12),
            elevation: 2.0,
            child: Icon(
              mute ? Icons.mic_off_outlined : Icons.mic_outlined,
              size: 20,
              color: mute ? white : purple,
            ),
          ),
          RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: white,
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.person_add_alt,
              color: purple,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: const CircleBorder(),
            fillColor: Colors.red,
            padding: const EdgeInsets.all(12),
            elevation: 2.0,
            child: Icon(
              Icons.call_end_outlined,
              color: white,
            ),
          ),
        ],
      ),
    );
  }

// gives info on amount of participants in the call
  Widget _panel() {
    return Visibility(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 110),
        child: Text(
          "You have ${_users.length} Participants left",
          style: TextStyle(color: white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            _viewRows(),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: ListTile(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: white,
                    )),
                trailing: MaterialButton(
                  color: const Color.fromRGBO(186, 186, 186, 0.5),
                  onPressed: () {
                    _engine.switchCamera();
                  },
                  padding: const EdgeInsets.all(15),
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.switch_camera_outlined,
                    color: white,
                  ),
                ),
              ),
            ),
            _panel(),
            _toolbar(),
          ],
        ),
      ),
    );
  }
}
