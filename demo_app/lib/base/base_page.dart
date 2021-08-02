import 'package:flutter/widgets.dart';

abstract class BasePage {
  // final String name;
  // final String route;
  // final WidgetBuilder builder;
  // page name
  String get mPageName;
  // page rout for globle
  String get mPageRoute;
  //
  WidgetBuilder get mPageBuilder;
}
