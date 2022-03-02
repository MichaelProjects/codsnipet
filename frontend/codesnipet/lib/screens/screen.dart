import 'package:codesnipet/controller/code_controller.dart';
import 'package:codesnipet/controller/search_controller.dart';
import 'package:codesnipet/controller/settings_controller.dart';
import 'package:codesnipet/screens/snipets/components/code_snipets.dart';
import 'package:codesnipet/screens/snipets/snipets.dart';
import 'package:codesnipet/screens/topbar/components/search_bar.dart';
import 'package:codesnipet/screens/topbar/topbar.dart';
import 'package:codesnipet/utils/api/urls.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await SettingsStorage().loadHostUrl();
      Urls.host = SettingsStorage.hostUrl;
      print(Urls.host);
      FetchController fetchController =
          Provider.of<FetchController>(context, listen: false);
      fetchController.fetchData(30, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    FetchController fetchController = Provider.of<FetchController>(context);
    SearchController searchController = Provider.of<SearchController>(context);
    var data = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [const TopBar(), SearchbarComponent(), DisplaySnipets()],
    ));
  }
}
