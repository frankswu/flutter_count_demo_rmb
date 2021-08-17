/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'dart:developer';

import 'package:demo_app/base/base_page.dart';
import 'package:demo_app/components/bottom_navigation_demo.dart';
import 'package:demo_app/src/form_widgets.dart';
import 'package:demo_app/src/validation.dart';
import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // return HomeComponent();
  return MainDemoPage(restorationId: ' Route Main Page');
});

// var normalRouteHandle = NormalRouterHandle()

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? message = params["message"]?.first;
  String? colorHex = params["color_hex"]?.first;
  String? result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    // color = Color(ColorHelpers.fromHexString(colorHex));
  }
  // return DemoSimpleComponent(
  //     message: message ?? 'Testing', color: color, result: result);
});

var demoFunctionHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      String? message = params["message"]?.first;
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Hey Hey!",
              style: TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? colorHex = params["color_hex"]?.first;
  String? result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    // color = Color(ColorHelpers.fromHexString(colorHex));
  }
  // return DemoSimpleComponent(
  //     message: "DEEEEEP LINK!!!", color: color, result: result);
});

main(List<String> args) {
  log("Hello，Frankswu");
}

var formValidationDemo = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  log("formValidationDemo ");
  return FormValidationDemo();
});


class NormalRouterHandle extends Handler {
  //
  
  NormalRouterHandle(BasePage page)
      : super(handlerFunc:
            (BuildContext? context, Map<String, List<String>> params) {
          log("normal router.page=${page.mPageName}");
          return page.mPageBuilder(context!);
        });
}
