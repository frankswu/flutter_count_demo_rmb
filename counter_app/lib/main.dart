import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

/**
 *  从继承 BlocDelegate 到继承 BlocObserver
 *  Custom [BlocObserver] which observes all bloc and cubit instances.
 */

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  // from 4.0 to 7.0 change
  //BlocSupervisor.delegate = MyBlocDelegate();
  Bloc.observer = MyBlocObserver();

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
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
        return MaterialApp(
          title: title,
          theme: theme,
          home: BlocProvider(
              create: (_) => CountCubit(),
              child: BlocBuilder<CountCubit, int>(builder: (_, theme) {
                return HomePage(title: title);
              })),
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
      onPressed: () => context.read<CountCubit>().increment(),
      tooltip: 'Increment Count',
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CountCubit, int>(builder: (_, count) {
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
              onPressed: () => context.read<CountCubit>().decrement(),
              child: Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              child: Icon(Icons.brightness_6),
            ),
          ),
        ],
      ),
    );
  }
}

class CountCubit extends Cubit<int> {
  CountCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

/**
 * /// A simple [Cubit] which manages the [ThemeData] as its state.
 */
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
