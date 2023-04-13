import 'package:get/state_manager.dart';

class IndexPageController extends GetxController {
  int indexPage = 0;

  int increment(int value) {
    indexPage = value;
    update();
    return indexPage;
  }
}
