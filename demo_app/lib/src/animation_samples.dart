// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:demo_app/base/base_page.dart';
import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';


void main() => runApp(const AnimationSamples());


class AnimationSamples extends StatelessWidget {
  const AnimationSamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // todo routes 必须设置在最外层的 MaterialApp 是有效，而且是唯一的
    return HomePage();
    
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Samples'),
      ),
      body: ListView(
        children: [
          // todo 这个 List<Widget> 列表里面具体的子类一样(其实都是ListTile)
          ListTile(title: Text('Basics', style: headerStyle)),
          ...basicDemosPages.map((e) => DemoTile3(mBasePage: e)),
          ListTile(title: Text('Http Demo', style: headerStyle)),
          ...httpDemos.map((d) => DemoTile(demo: d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscDemos.map((d) => DemoTile(demo: d)),
          ListTile(title: Text('Json Demo', style: headerStyle)),
          ...jsonDemos.map((e) => DemoTile(demo: e)),
          ListTile(title: Text('List Demo', style: headerStyle)),
          ...infiniteListDemos.map((e) => DemoTile(demo: e)),
          ListTile(title: Text('Count Demo', style: headerStyle)),
          ...countDemos.map((e) => DemoTile(demo: e)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        print("click router.Navigator.pushNamed=${demo.route}");
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

class DemoTile2 extends StatelessWidget {
  final Demo demo;

  const DemoTile2({required this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        print("click router.Navigator.push=${demo.route}");
        Navigator.push(context, MaterialPageRoute(builder: demo.builder));
        // Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

class DemoTile3 extends StatelessWidget {
  final BasePage mBasePage;

  const DemoTile3({required this.mBasePage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mBasePage.mPageName),
      onTap: () {
        print("click router3.Navigator.push=${mBasePage.mPageRoute}");
        Navigator.push(context, MaterialPageRoute(builder: mBasePage.mPageBuilder));
        // Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

// basicDemosPages.map((d) => MapEntry(d.mPageRoute, d.mPageBuilder)));

