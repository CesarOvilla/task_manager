
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:task_manager/pages/form_task/form_task_page.dart';
import 'package:task_manager/pages/principal/principal_page.dart';



class RouterGet {
  static List<GetPage> routesGet() {
    return [
      GetPage(
        name: '/home',
        page: () => const PrincipalPage(),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: '/formTask',
        page: () => const FormTaskPage(),
        transition: Transition.rightToLeft,
      ),
      
    ];
  }
}
