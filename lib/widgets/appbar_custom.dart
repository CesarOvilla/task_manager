import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/color_app.dart';
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
        fontSize: 25,
      ),
      elevation: 0,
      centerTitle: true,
      leading: back != false
          ? GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: ColorApp.black,
              ),
              onTap: () => Get.back(),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
