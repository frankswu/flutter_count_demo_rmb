import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(FlutterNormalApp(
    title: "Flutter Normal Demo",
  ));
}


class FlutterNormalApp extends StatefulWidget {

  final String title;

  const FlutterNormalApp({Key? key, required this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _FlutterNormalAppState(title);
  }

}

class _FlutterNormalAppState extends State<FlutterNormalApp> {

  final String title;
  ThemeData themeData = ThemeData.dark();
  

  final StreamController<int> _streamThemeDataController = StreamController<int>();

  _FlutterNormalAppState(this.title);

// TODO fix bug not toggle theme
  ThemeData toggleTheme() {
    return   (themeData == ThemeData.dark()) ? ThemeData.light() : ThemeData.dark();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamThemeDataController.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return MaterialApp(
              title: title,
              theme: toggleTheme(),
              home: HomePage(view: this, title: title),
            );      
      }
    );
  }

}
// 有状态 页面
class HomePage extends StatefulWidget {
  final String title;
  final _FlutterNormalAppState view;

  const HomePage({Key? key, required this.title, required this.view}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _HomePageState(view);
}

class _HomePageState extends State<HomePage> {

  int _count = 0;
  final _FlutterNormalAppState view;

  final StreamController<int> _streamController = StreamController<int>();

  _HomePageState(this.view);

  get themeData => null;


  @override
  void dispose() {
    // 生命周期销毁的时候，_streamController一起销毁
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var floatingActionButton1 = FloatingActionButton(
      // Attach the `callback` to the `onPressed` attribute
              onPressed: () {
                _streamController.sink.add(++_count);
              },
      tooltip: 'Increment Count',
      child: Icon(Icons.add),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            // Text 控件需要使用StreamBuilder 包装一层才能有相应能力
            StreamBuilder<int>(
              stream: _streamController.stream,
              initialData: _count,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return   Text('${snapshot.data}', style: Theme.of(context).textTheme.display1);
              },
            )
,          ],
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
              onPressed: () {
                _streamController.sink.add(--_count);
              },
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () {
                view._streamThemeDataController.sink.add(0);
              },
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

