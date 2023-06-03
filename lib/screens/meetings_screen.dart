import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/jitsi_meet_methods.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMthods _jitsiMeetMthods = JitsiMeetMthods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMthods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, 'video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeMeetingButton(
            onPressed: createNewMeeting,
            text: 'New Meeting',
            icon: Icons.videocam,
          ),
          HomeMeetingButton(
            onPressed: joinMeeting(context),
            text: 'Join Meeting',
            icon: Icons.add_box_rounded,
          ),
          HomeMeetingButton(
            onPressed: () {},
            text: 'Schedule',
            icon: Icons.calendar_today,
          ),
          HomeMeetingButton(
            onPressed: () {},
            text: 'Share Screen',
            icon: Icons.arrow_upward,
          )
        ],
      ),
      const Expanded(
          child: Center(
        child: Text(
          'Create or Join Meetings with just a click',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ))
    ]);
  }
}
