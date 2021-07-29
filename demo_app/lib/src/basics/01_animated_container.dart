// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class Style {
  late Color color;
  late double borderRadius;
  late double margin;

  void generateStyle() {
    this.color = generateColor();
    this.borderRadius = generateBorderRadius();
    this.margin = generateMargin();
    print(
        "color=${this.color}, radius=${this.borderRadius}, margin=${this.margin}");
  }
}

class AnimatedContainerDemo2 extends StatelessWidget {
  static String routeName = '/basics/01_animated_container';

  const AnimatedContainerDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => StyleCubit(), child: InnerAnimatedContainerDemo());
  }
}

class InnerAnimatedContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("builder.color=");
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: BlocBuilder<StyleCubit, Style>(builder: (_, style) {
        print(
            "blocbuilder.color=${style.color}, radius=${style.borderRadius}, margin=${style.margin}");
        return Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(style.margin),
                  decoration: BoxDecoration(
                    color: style.color,
                    borderRadius: BorderRadius.circular(style.borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Change Style',
              ),
              onPressed: () => context.read<StyleCubit>().changeStyle(),
            ),
          ],
        ));
      }),
    );
  }
}

class StyleCubit extends Cubit<Style> {
  StyleCubit() : super(Style()) {
    state.generateStyle();
  }

  void changeStyle() {
    print("changeStyle");
    state.generateStyle();
    emit(state);
    print(
        "color=${state.color}, radius=${state.borderRadius}, margin=${state.margin}");
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);
  static String routeName = '/basics/01_animated_container';

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Style style;

  @override
  void initState() {
    super.initState();
    style = Style();
    style.generateStyle();
  }

  void change() {
    setState(() {
      style.generateStyle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This widget is built using an AnimatedContainer, one of the easiest to use
    // animated Widgets. Whenever the AnimatedContainer's properties, such as decoration,
    // change, it will handle animating from the previous value to the new value. You can
    // specify both a Duration and a Curve for the animation.
    // This Widget is useful for designing animated interfaces that just need to change
    // the properties of a container. For example, you could use this to design expanding
    // and shrinking cards.
    print(
        "build.color=${style.color}, radius=${style.borderRadius}, margin=${style.margin}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(style.margin),
                  decoration: BoxDecoration(
                    color: style.color,
                    borderRadius: BorderRadius.circular(style.borderRadius),
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'change',
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}
