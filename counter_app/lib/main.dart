import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// TODO https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/

class MyBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  runApp(FlutterBlocApp(
    title: "Flutter Bloc Demo",
  ));
}

class FlutterBlocApp extends StatelessWidget {
  final String title;

  const FlutterBlocApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(builder: (_, theme) {
        return MaterialApp(
          title: title,
          theme: theme,
          home: BlocProvider(
              create: (_) => CountBloc(), child: HomePage(title: title)),
        );
      }),
    );
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
      onPressed: () => context.bloc<CountBloc>().add(CountEvent.increment),
      tooltip: 'Increment Count',
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CountBloc, int>(builder: (_, count) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$count',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        );
      }),
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
              onPressed: () =>
                  context.bloc<CountBloc>().add(CountEvent.decrement),
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () => context.bloc<ThemeBloc>().add(ThemeEvent.toggle),
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

enum CountEvent { increment, decrement }

class CountBloc extends Bloc<CountEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CountEvent event) async* {
    switch (event) {
      case CountEvent.increment:
        yield state + 1;
        break;
      case CountEvent.decrement:
        yield state - 1;
        break;
      default:
        throw Exception("no");
    }
  }
}

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();
        break;
    }
  }
}

