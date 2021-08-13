/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";

// final httpDemos = [
//   Demo(
//     name: 'Sign in with HTTP',
//     route: '/signin_http',
//     builder: (context) => SignInHttpDemo(
//       httpClient: httpClient,
//     ),
//   ),
//   Demo(
//     name: 'Autofill',
//     route: '/autofill',
//     builder: (context) => const AutofillDemo(),
//   ),
//   Demo(
//     name: 'Form widgets',
//     route: '/form_widgets',
//     builder: (context) => const FormWidgetsDemo(),
//   ),
//   Demo(
//     name: 'Validation',
//     route: '/validation',
//     builder: (context) => const FormValidationDemo(),
//   ),
// ];

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(demoFunc, handler: demoFunctionHandler);
    router.define(deepLink, handler: deepLinkHandler);
  }
}
