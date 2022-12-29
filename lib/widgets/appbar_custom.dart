import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/widgets/text_custom.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    this.back = false,
  }) : super(key: key);

  final String title;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextCustom(
        title,
        colorFont: Colors.black,
      ),
      elevation: 0,
      // backgroundColor: Colors.white,
      centerTitle: true,
      leading: back != false
          ? GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () => Get.back(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
