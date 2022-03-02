import 'package:codesnipet/controller/code_controller.dart';
import 'package:codesnipet/controller/crud_code.dart';
import 'package:codesnipet/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:menubar/menubar.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'controller/search_controller.dart';
import 'controller/settings_controller.dart';
import 'utils/api/urls.dart';
import 'utils/dark_theme.dart';
import 'utils/light_theme.dart';
import 'utils/nav_route.dart';

Submenu subMenue = Submenu(label: "Settings", children: [
  MenuItem(
      label: "edit",
      onClicked: () {
        print("Hello world");
      })
]);

void main() async {
  //setApplicationMenu([subMenue]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchController()),
          ChangeNotifierProvider(create: (_) => FetchController()),
          ChangeNotifierProvider(create: (_) => CRUDController()),
        ],
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate:
                RoutemasterDelegate(routesBuilder: (context) => routes),
            // ignore: prefer_const_constructors
            routeInformationParser: RoutemasterParser(),
            title: 'Codsnipet',
            darkTheme: buildDarkThemeData(context),
            theme: buildLightThemeData(context)));
  }
}
