import 'package:codsnipet/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'guard.dart';

final routes = RouteMap(routes: {
  '/': (routeData) => AuthGuard.canUserAccessPage()
      ? MaterialPage(child: MainScreen())
      : const MaterialPage(
          child: Scaffold(
              body: Center(
                  child: Text('You are not authorized to access this page')))),
});
