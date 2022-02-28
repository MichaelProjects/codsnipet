import 'package:codesnipet/controller/code_controller.dart';
import 'package:codesnipet/screens/snipets/components/code_snipets.dart';
import 'package:codesnipet/screens/topbar/components/search_bar.dart';
import 'package:codesnipet/screens/topbar/topbar.dart';
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      FetchController fetchController =
          Provider.of<FetchController>(context, listen: false);
      fetchController.fetchData(30, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    FetchController fetchController = Provider.of<FetchController>(context);
    var data = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        const TopBar(),
        SearchbarComponent(),
        Container(
            height: data.height - 140,
            width: data.width,
            child: Builder(builder: (context) {
              print(fetchController.state);
              switch (fetchController.state) {
                case FetcherState.loading:
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                case FetcherState.failed:
                  {
                    return Container(
                        child: Center(
                      child: Text("Failed to fetch data",
                          style: TextStyle(color: Colors.red)),
                    ));
                  }
                case FetcherState.loaded:
                  {
                    print("fetched");
                    List<Widget> widgets = [];
                    for (var x in fetchController.data) {
                      widgets.add(CodeSnipets(x, key: Key(x.id)));
                    }
                    return LayoutBuilder(builder: (context, constraints) {
                      return GridView.count(
                          crossAxisCount: constraints.maxWidth > 1200
                              ? 3
                              : constraints.maxWidth < 800
                                  ? 1
                                  : 2,
                          childAspectRatio: 1.9,
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: widgets);
                    });
                  }
                default:
                  {
                    return Container(
                        child:
                            Center(child: Text("Waiting to start loading...")));
                  }
              }
            }))
      ],
    ));
  }
}
