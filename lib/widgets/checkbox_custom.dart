import 'package:flutter/material.dart';
import 'package:task_manager/widgets/text_custom.dart';

class CheckboxCustom extends StatelessWidget {
  const CheckboxCustom({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.text,
  }) : super(key: key);

  final bool value;
  final void Function(bool?) onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          TextCustom(
            text,
            fontSize: 20,
          )
        ],
      ),
    );
  }
}
