import 'package:flutter/material.dart';
import 'package:task_manager/widgets/appbar_custom.dart';
import 'package:task_manager/widgets/card_task.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarCustom(
          title: "Task Manager",
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Completadas',
                  ),
                  Tab(
                    text: 'Incompletas',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const CardTask(
                          color: Colors.greenAccent,
                          taskName: "primis",
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const CardTask(
                          color: Colors.yellowAccent,
                          taskName: "segundis",
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
