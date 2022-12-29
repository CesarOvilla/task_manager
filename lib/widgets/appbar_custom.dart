import 'package:flutter/material.dart';
import 'package:task_manager/widgets/text_custom.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextCustom(
        title,
        colorFont: Colors.black,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
