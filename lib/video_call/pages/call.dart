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
  RtcEngine? _engine;

  @override
  void initState() async{
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _users.clear();
    _engine!.leaveChannel();
    

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
    _engine!.cr\
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue App'),
        centerTitle: true,
      ),
    );
  }
}
