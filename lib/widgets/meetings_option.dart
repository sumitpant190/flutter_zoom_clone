// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_zoom_clone/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MeetingOption({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChange)
        ],
      ),
    );
  }
}
