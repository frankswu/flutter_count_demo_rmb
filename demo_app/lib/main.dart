// Copyright 2019-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:demo_app/tab_pages.dart';
import 'package:flutter/material.dart';

import 'data_transfer_page.dart';
import 'infinite_process_page.dart';
import 'performance_page.dart';
import 'bottom_navigation_demo.dart';

import 'package:demo_app/src/basics/01_animated_container.dart';
import 'package:demo_app/src/basics/02_page_route_builder.dart';
import 'package:demo_app/src/basics/03_animation_controller.dart';
import 'package:demo_app/src/basics/04_tweens.dart';
import 'package:demo_app/src/basics/05_animated_builder.dart';
import 'package:demo_app/src/basics/06_custom_tween.dart';
import 'package:demo_app/src/basics/07_tween_sequence.dart';
import 'package:demo_app/src/basics/08_fade_transition.dart';
import 'package:demo_app/src/misc/animated_list.dart';
import 'package:demo_app/src/misc/animated_positioned.dart';
import 'package:demo_app/src/misc/animated_switcher.dart';
import 'package:demo_app/src/misc/card_swipe.dart';
import 'package:demo_app/src/misc/carousel.dart';
import 'package:demo_app/src/misc/curved_animation.dart';
import 'package:demo_app/src/misc/expand_card.dart';
import 'package:demo_app/src/misc/focus_image.dart';
import 'package:demo_app/src/misc/hero_animation.dart';
import 'package:demo_app/src/misc/physics_card_drag.dart';
import 'package:demo_app/src/misc/repeating_animation.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

final basicDemos = [
  Demo(
      name: 'AnimatedContainer',
      route: AnimatedContainerDemo.routeName,
      builder: (context) => const AnimatedContainerDemo()),
  Demo(
      name: 'PageRouteBuilder',
      route: PageRouteBuilderDemo.routeName,
      builder: (context) => const PageRouteBuilderDemo()),
  Demo(
      name: 'Animation Controller',
      route: AnimationControllerDemo.routeName,
      builder: (context) => const AnimationControllerDemo()),
  Demo(
      name: 'Tweens',
      route: TweenDemo.routeName,
      builder: (context) => const TweenDemo()),
  Demo(
      name: 'AnimatedBuilder',
      route: AnimatedBuilderDemo.routeName,
      builder: (context) => const AnimatedBuilderDemo()),
  Demo(
      name: 'Custom Tween',
      route: CustomTweenDemo.routeName,
      builder: (context) => const CustomTweenDemo()),
  Demo(
      name: 'Tween Sequences',
      route: TweenSequenceDemo.routeName,
      builder: (context) => const TweenSequenceDemo()),
  Demo(
      name: 'Fade Transition',
      route: FadeTransitionDemo.routeName,
      builder: (context) => const FadeTransitionDemo()),
];

final miscDemos = [
  Demo(
      name: 'Expandable Card',
      route: ExpandCardDemo.routeName,
      builder: (context) => const ExpandCardDemo()),
  Demo(
      name: 'Carousel',
      route: CarouselDemo.routeName,
      builder: (context) => CarouselDemo()),
  Demo(
      name: 'Focus Image',
      route: FocusImageDemo.routeName,
      builder: (context) => const FocusImageDemo()),
  Demo(
      name: 'Card Swipe',
      route: CardSwipeDemo.routeName,
      builder: (context) => const CardSwipeDemo()),
  Demo(
      name: 'Repeating Animation',
      route: RepeatingAnimationDemo.routeName,
      builder: (context) => const RepeatingAnimationDemo()),
  Demo(
      name: 'Spring Physics',
      route: PhysicsCardDragDemo.routeName,
      builder: (context) => const PhysicsCardDragDemo()),
  Demo(
      name: 'AnimatedList',
      route: AnimatedListDemo.routeName,
      builder: (context) => const AnimatedListDemo()),
  Demo(
      name: 'AnimatedPositioned',
      route: AnimatedPositionedDemo.routeName,
      builder: (context) => const AnimatedPositionedDemo()),
  Demo(
      name: 'AnimatedSwitcher',
      route: AnimatedSwitcherDemo.routeName,
      builder: (context) => const AnimatedSwitcherDemo()),
  Demo(
      name: 'Hero Animation',
      route: HeroAnimationDemo.routeName,
      builder: (context) => const HeroAnimationDemo()),
  Demo(
      name: 'Curved Animation',
      route: CurvedAnimationDemo.routeName,
      builder: (context) => const CurvedAnimationDemo()),
];

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

void main() {
  runApp(
    MaterialApp(
      routes: allRoutes,
      home: MainDemoPage(
        restorationId: 'Bottom Navigation',
      ),
    ),
  );
}
