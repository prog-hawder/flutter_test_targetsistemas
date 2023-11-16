
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {

  @observable
 String anotacao = "";

  @action
  changeAnotacao(String value) async {
      anotacao = value;
    
  }
}
