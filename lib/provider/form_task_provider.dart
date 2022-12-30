import 'package:get/get.dart';

class FormTaskProvider extends GetxController {
  final RxBool _moreOption = false.obs;
  final RxBool _complete = false.obs;

  RxBool get moreOption => _moreOption;
  RxBool get complete => _complete;

  void changeComplete(bool? value) {
    _complete.value = value!;
  }

  void changeOption(bool value) {
    _moreOption.value = value;
  }
}
