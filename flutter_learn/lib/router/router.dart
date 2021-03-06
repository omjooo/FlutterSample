import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/page/utils/camera_complex.dart';
import 'package:flutter_learn/router/switch_animation.dart';
import 'package:flutter_learn/view/web_view_page.dart';

class XRouter {
  static Router router;

  static void init() {
    router = new Router();
    configureRoutes(router);
  }

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return null;
    });

    router.define('/web', handler: webViewPageHand);
  }

  static void goto(BuildContext context, String pageName) {
    Navigator.push(context, SlidePageRoute(routeName: pageName));
  }

  static void gotoWidget(BuildContext context, Widget widget) {
    Navigator.push(context, SlidePageRoute(widget: widget));
  }
}

Handler webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});
