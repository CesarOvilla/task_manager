import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 18, left: 15, right: 10),
      elevation: 1,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () async {
          //no action
        },
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              Container(
                width: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.description),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Task name",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.calendar_month),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "2025-12-12",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
