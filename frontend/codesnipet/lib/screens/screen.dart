import 'package:codesnipet/screens/snipets/components/code_snipets.dart';
import 'package:codesnipet/screens/topbar/components/search_bar.dart';
import 'package:codesnipet/screens/topbar/topbar.dart';
import 'package:codesnipet/utils/model/code_snipets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TopBar(),
        SearchbarComponent(),
        CodeSnipets(CodeSnip.mockData())
      ],
    ));
  }
}
