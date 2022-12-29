import 'package:flutter/material.dart';
import 'package:task_manager/widgets/text_custom.dart';

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final TextCustom text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: text,
        ),
      ],
    );
  }
}
