import 'package:mobx/mobx.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuController with _$MenuController;

abstract class _MenuController with Store {
  @observable
  bool isManualContext = false;

  @action
  void changeBarState(int index) {
    if(index == 3 || index == 2 && isManualContext) {
      isManualContext = true;
    }else{
      isManualContext = false;
    }
  }
}