import 'package:airport_finder/app/map/map.dart';
import 'package:airport_finder/route/route_links.dart';
import 'package:flutter/cupertino.dart';

import '../app/home/main_page_view.dart';

class ApplicationRoute {
  static final ApplicationRoute _singleton = ApplicationRoute._internal();

  factory ApplicationRoute() {
    return _singleton;
  }

  ApplicationRoute._internal();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ApplicationRouteLink.HOME:
        return CupertinoPageRoute(
          builder: (_) => const MainPage(),
          settings: settings,
        );
      case ApplicationRouteLink.MAP:
        return CupertinoPageRoute(
            builder: (_) => MapScreen(), settings: settings);
    }
    return null;
  }

}
