import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'counter.dart';
import 'themer.dart'; // Import the Counter


final counter = Counter(); // Instantiate the store
final themer = Themer();

void main() {
  runApp(FlutterMobxApp(title: "Flutter Mobx Demo",));
}

class FlutterMobxApp extends StatelessWidget {
  final String title;

  const FlutterMobxApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => MaterialApp(
            title: title, theme: themer.value, home: HomePage(title: title)));
  }
}

class HomePage extends StatelessWidget {
  //
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var floatingActionButton1 = FloatingActionButton(
      // Attach the `callback` to the `onPressed` attribute
      onPressed: counter.increment,
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
            // Wrapping in the Observer will automatically re-render on changes to counter.value

            Observer(
                builder: (_) => Text(
                      '${counter.value}',
                      style: Theme.of(context).textTheme.display1,
                    )),
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
              onPressed: counter.decrement,
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: themer.toggle,
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

