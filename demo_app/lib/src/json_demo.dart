
import 'package:demo_app/tab_pages.dart';
import 'package:flutter/material.dart';


// json demo
class JsonDemoPage extends StatelessWidget {
  const JsonDemoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const tabWidgets = [
      BasicsPage(),
      ConvertedSimplePage(),
      ConvertedComplexPage(),
      ConvertedListPage(),
      SerializableSimplePage(),
      SerializableComplexPage(),
      SerializableListPage(),
      BuiltSimplePage(),
      BuiltComplexPage(),
      BuiltListPage(),
    ];
    const tabsIconText = [
      Tab(text: 'Basics'),
      Tab(text: 'Conv. Simple'),
      Tab(text: 'Conv. Complex'),
      Tab(text: 'Conv. List'),
      Tab(text: 'Ser. Simple'),
      Tab(text: 'Ser. Complex'),
      Tab(text: 'Ser. List'),
      Tab(text: 'Built Simple'),
      Tab(text: 'Built Complex'),
      Tab(text: 'Built List'),
    ];
    return DefaultTabController(
      length: tabWidgets.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,// 直接设置高，把Title顶掉
          bottom: const TabBar(
            tabs: tabsIconText,
            isScrollable: true,
          ),
        ),
        body: const TabBarView(
          children: tabWidgets,
        ),
      ),
    );
  }
}
