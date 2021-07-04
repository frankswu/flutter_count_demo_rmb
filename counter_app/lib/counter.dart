import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

// https://mobx.netlify.app/getting-started
// This is the class used by rest of your codebase
// _$Counter 是生成的, 在项目路径项目执行如下：
// flutter packages pub run build_runner build
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  //
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
  
}
