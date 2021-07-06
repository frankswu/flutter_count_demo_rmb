import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
// 网络层dio依赖
import 'package:dio/dio.dart';

void main() {

  var flutterProviderApp = FlutterProviderApp(
    title: "Flutter Provider Demo",
  );
  var dateTime = DateTime.now();
  print("startTime$dateTime");
//    print("endTime=${DateTime.now().microsecond-dateTime.microsecond}");

  getHttp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => CountModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeModel(),
        )
      ],
      child: flutterProviderApp,
    ),
  );
    print("endTime=${DateTime.now().microsecond-dateTime.microsecond}");

}

void getHttp() async {
  try {
    // web device debug 有跨域支持问题
    var startTime = DateTime.now();
    print("startTime.getHttp=$startTime");
    String path = 'https://www.baidu.com';
    var response = await Dio().get(path);
    //print(response);
    print("endTime.getHttp=${DateTime.now().microsecond-startTime.microsecond}");
  } catch (e) {
    print(e);
  }
}

class FlutterProviderApp extends StatelessWidget {
  final String title;

  const FlutterProviderApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return MaterialApp(
        title: title,
        theme: theme.themeData,
        home: HomePage(title: title),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var floatingActionButton1 = FloatingActionButton(
      // Attach the `callback` to the `onPressed` attribute
      onPressed: () =>
          Provider.of<CountModel>(context, listen: false).incrementCount(),
      tooltip: 'Increment Count',
      child: Icon(Icons.add),
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
            Consumer<CountModel>(builder: (context, count, child) {
              return Text(
                '${count._count}',
                style: Theme.of(context).textTheme.display1,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: floatingActionButton1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () => Provider.of<CountModel>(context, listen: false)
                  .decreaseCount(),
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              //// Provider.of is another way to access the model object held
              // by an ancestor Provider. By default, even this listens to
              // changes in the model, and rebuilds the whole encompassing widget
              // when notified.
              // 下面使用 `listen: false`，我们禁用了默认行为。在这里我们只是调用函数，我们不需要关心当前值
              // 没有`listen: false` ，当ThemeModel 被通知改变的时候，会重刷新整个FlutterProviderApp
              onPressed: () =>
                  Provider.of<ThemeModel>(context, listen: false).toggleTheme(),
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

class CountModel extends ChangeNotifier {
  int _count = 0;

  void incrementCount() {
    _count++;
    var dateTime = DateTime.now();
    print("startTime$dateTime");
    getHttp();
    print("endTime=${DateTime.now().microsecond-dateTime.microsecond}");
    notifyListeners();
  }

  void decreaseCount() {
    _count--;
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  ThemeData themeData = ThemeData.dark();

  void toggleTheme() {
    themeData =
        (themeData == ThemeData.dark()) ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}

