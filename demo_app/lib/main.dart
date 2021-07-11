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

import 'package:flutter/material.dart';

import 'data_transfer_page.dart';
import 'infinite_process_page.dart';
import 'performance_page.dart';
import 'bottom_navigation_demo.dart';

void main() {
  runApp(
    const MaterialApp(
      home: BottomNavigationDemo(
        restorationId: 'Bottom Navigation',
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const tabWidgets = [
      PerformancePage(),
      InfiniteProcessPageStarter(),
      DataTransferPageStarter(),
      BottomNavigationDemo(
        restorationId: 'Bottom Navigation',
      ),
    ];
    const tabsIconText = [
      Tab(
        icon: Icon(Icons.flash_on),
        text: 'Performance',
      ),
      Tab(
        icon: Icon(Icons.sync),
        text: 'Infinite Process',
      ),
      Tab(
        icon: Icon(Icons.storage),
        text: 'Data Transfer',
      ),
      Tab(
        icon: Icon(Icons.label_important),
        text: 'Bottom Navigation',
      )
    ];
    return MaterialApp(
      home: DefaultTabController(
        length: tabWidgets.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabsIconText,
            ),
            title: const Text('Isolate Example'),
          ),
          body: const TabBarView(
            children: tabWidgets,
          ),
        ),
      ),
    );
  }
}
