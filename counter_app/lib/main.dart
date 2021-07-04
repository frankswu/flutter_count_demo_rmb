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

  _FlutterNormalAppState(this.title);

  void toggleTheme() {
    setState(() {
      themeData = (themeData == ThemeData.dark()) ? ThemeData.light() : ThemeData.dark();
      //return themeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: this.themeData,
      home: HomePage(view: this, title: title),
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

  _HomePageState(this.view);

  get themeData => null;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decreaseCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var floatingActionButton1 = FloatingActionButton(
      // Attach the `callback` to the `onPressed` attribute
      onPressed: _incrementCount,
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
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display1,
            ),
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
              onPressed: _decreaseCount,
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: view.toggleTheme,
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

