import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// 一个简单的action: Increment
enum Actions { Increment, Decrease, ToggleTheme }

class MyState {
  int count;
  ThemeData themeData;

  MyState(this.count, this.themeData);
}

// 这个reducer, 当有自增的Action请求后，就把count 自增
MyState counterReducer(MyState state, dynamic action) {
  if (action == Actions.Increment) {
    state.count = state.count + 1;
  } else if (action == Actions.Decrease) {
    state.count = state.count - 1;
  } else if (action == Actions.ToggleTheme) {
    state.themeData = (state.themeData == ThemeData.dark())
        ? ThemeData.light()
        : ThemeData.dark();
  }

  return state;
}

void main() {
  // 在主函数或者 内部state 对象，创建store作为一个 final 变量。
  // 这样直接在构建函数中工作比热加载更好
  final store = Store<MyState>(counterReducer,
      initialState: MyState(0, ThemeData.dark()));

  runApp(FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<MyState> store;
  final String title;

  FlutterReduxApp({Key? key, required this.store, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 需要用这个 StoreProvider来包裹你的 MaterialApp 或者 WidgetsApp. 这会确保所有路由通过这个store

    return StoreProvider<MyState>(
      // 通过持有StoreProvider. 任何被`StoreConnector`包裹的
      // Widgets 可以找到和使用这个值`Store`.
      store: store,
      child: StoreConnector<MyState, ThemeData>(
        converter: (store) {
          return store.state.themeData;
        },
        builder: (context, themeData) {
          return MaterialApp(
            theme: themeData,
            title: title,
            home: HomePage(title: title),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var floatingActionButton1 = StoreConnector<MyState, List<VoidCallback>>(
      converter: (store) {
        // 返回一个 `VoidCallback`,是一个想要没有参数的函数。
        // 只是分发一个Increment action.
        var callbackList = <VoidCallback>[];
        callbackList.add(() => store.dispatch(Actions.Increment));
        callbackList.add(() => store.dispatch(Actions.Decrease));
        callbackList.add(() => store.dispatch(Actions.ToggleTheme));
        return callbackList;
      },
      builder: (context, callback) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                // Attach the `callback` to the `onPressed` attribute
                onPressed: callback[0],
                tooltip: 'asdasdasd',
                child: Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                onPressed: callback[1],
                child: Icon(Icons.remove),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                onPressed: callback[2],
                child: Icon(Icons.brightness_6),
              ),
            ),
          ],
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            // 联结这个 Store 到一个Text Widget，renders当前的count值
            // 我们用`StoreConnector`包裹的Text Widget。这个
            // `StoreConnector` 会从最近的父级`StoreProvider`找到这个 `Store`
            // 把最后的count值转换成string，将这个string作为count传递到 `builder`函数
            // 每次按钮被点击，一个Action就会被分发& 跑到reducer处理。当reducer修改状态后，
            // 这个Widget会自动重建count。不需要手动管理订阅或者流。
            StoreConnector<MyState, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            )
          ],
        ),
      ),
      // 链接 the Store 到 a FloatingActionButton. 在这个例子，我们会用store来构建callback来分发Increment Action。
      // 然后，我们通过这个 callback来持有按钮的`onPressed`操作
      floatingActionButton: floatingActionButton1,
    );
  }
}
