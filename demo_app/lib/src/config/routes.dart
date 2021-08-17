/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:demo_app/base/base_page.dart';
import 'package:demo_app/src/autofill.dart';
import 'package:demo_app/src/form_widgets.dart';
import 'package:demo_app/src/validation.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";

  static var formWidgetsDemo = NormalRouterHandle(FormWidgetsDemo());

  static List<BasePage> listWidgets = [AutofillDemo(), FormWidgetsDemo()];

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    
    listWidgets.forEach((page) {
      router.define(page.mPageRoute, handler: NormalRouterHandle(page));
    });
    router.define('/validation', handler: formValidationDemo);


    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(demoFunc, handler: demoFunctionHandler);
    router.define(deepLink, handler: deepLinkHandler);
  }
}
