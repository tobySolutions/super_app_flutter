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
