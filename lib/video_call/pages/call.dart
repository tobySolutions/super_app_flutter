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
  void initState() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue App'),
        centerTitle: true,
      ),
      body: Stack(
        children: const [],
      ),
    );
  }
}
