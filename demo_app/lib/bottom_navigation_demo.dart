// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'data_transfer_page.dart';
import 'infinite_process_page.dart';
import 'main.dart';
import 'performance_page.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

enum BottomNavigationDemoType {
  withLabels,
  withoutLabels,
}

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({
    Key? key,
    required this.restorationId,
    BottomNavigationDemoType? type,
  }) : super(key: key);

  final String restorationId;
  final BottomNavigationDemoType type = BottomNavigationDemoType.withoutLabels;

  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo>
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  String _title(BuildContext context) {
    // switch (widget.type) {
    //   case BottomNavigationDemoType.withLabels:
    //     return "常驻标签页";
    //   case BottomNavigationDemoType.withoutLabels:
    //     return "已选择标签";
    // }
    return "已选择标签";
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Isolate Demo",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_comment),
        label: "Infinite Process",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.calendar_today),
        label: "Data Transfer",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: "Other Demo",
      ),
      // BottomNavigationBarItem(
      //   icon: const Icon(Icons.account_circle),
      //   label: "帐号",
      // ),
      // BottomNavigationBarItem(
      //   icon: const Icon(Icons.alarm_on),
      //   label: "闹钟",
      // ),
      // BottomNavigationBarItem(
      //   icon: const Icon(Icons.camera_enhance),
      //   label: "相机",
      // ),
    ];

    const tabWidgets = [
      PerformancePage(),
      InfiniteProcessPageStarter(),
      DataTransferPageStarter(),
      HomePage(),
    ];

    // if (widget.type == BottomNavigationDemoType.withLabels) {
    //   bottomNavigationBarItems = bottomNavigationBarItems.sublist(
    //       0, bottomNavigationBarItems.length - 2);
    //   _currentIndex.value = _currentIndex.value
    //       .clamp(0, bottomNavigationBarItems.length - 1)
    //       .toInt();
    // }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_title(context)),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: tabWidgets[_currentIndex.value],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels:
            widget.type == BottomNavigationDemoType.withLabels,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.caption!.fontSize!,
        unselectedFontSize: textTheme.caption!.fontSize!,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        selectedItemColor: colorScheme.onPrimary,
        unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
        backgroundColor: colorScheme.primary,
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({Key? key, required this.item})
      : super(key: key);

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/demos/bottom_navigation_background.png',
                ),
              ),
            ),
          ),
        ),
        Center(
          child: IconTheme(
            data: const IconThemeData(
              color: Colors.white,
              size: 80,
            ),
            child: Semantics(
              label: "“${item.label}”标签页的占位符",
              child: item.icon,
            ),
          ),
        ),
      ],
    );
  }
}
