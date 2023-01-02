import 'package:flutter/material.dart';
import 'package:task_manager/widgets/icon_text.dart';
import 'package:task_manager/widgets/text_custom.dart';

class CardTask extends StatelessWidget {
  const CardTask(
      {Key? key,
      this.date,
      required this.color,
      required this.taskName,
      required this.onTap})
      : super(key: key);

  final Color color;
  final String taskName;
  final String? date;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 18, left: 15, right: 10),
      elevation: 1,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              Container(
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  color: color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(
                      icon: Icons.description,
                      text: TextCustom(
                        taskName,
                        fontSize: 16,
                      ),
                    ),
                    IconText(
                      icon: Icons.calendar_month,
                      text: TextCustom(
                        date ?? 'indefinido',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: 50,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
