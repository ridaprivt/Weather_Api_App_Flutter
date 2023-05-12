import 'package:get/get.dart';

class myAppController extends GetxController {
  var myIndex = 0;
  RxBool ispressed = true.obs;

  void changeIndex(int index) {
    myIndex = index;
    update();
  }

  void onClick() {
    ispressed.toggle();
  }
}
