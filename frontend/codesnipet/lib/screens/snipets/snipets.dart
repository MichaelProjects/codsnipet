import 'package:codesnipet/controller/code_controller.dart';
import 'package:codesnipet/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/code_snipets.dart';

class DisplaySnipets extends StatefulWidget {
  DisplaySnipets({Key? key}) : super(key: key);

  @override
  State<DisplaySnipets> createState() => DisplaySnipetsState();
}

class DisplaySnipetsState extends State<DisplaySnipets> {
  @override
  Widget build(BuildContext context) {
    FetchController fetchController = Provider.of<FetchController>(context);
    SearchController searchController = Provider.of<SearchController>(context);
    var data = MediaQuery.of(context).size;
    return SizedBox(
        height: data.height - 140,
        width: data.width,
        child: Builder(builder: (context) {
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
                List<Widget> widgets = [];
                if (searchController.searchResult.isNotEmpty) {
                  for (var x in searchController.searchResult) {
                    widgets.add(CodeSnipets(x, key: Key(x.id)));
                  }
                } else {
                  for (var x in fetchController.data) {
                    widgets.add(CodeSnipets(x, key: Key(x.id)));
                  }
                }
                return LayoutBuilder(builder: (context, constraints) {
                  return GridView.count(
                      crossAxisCount: constraints.maxWidth > 1200
                          ? 3
                          : constraints.maxWidth < 800
                              ? 1
                              : 2,
                      childAspectRatio: 1.3,
                      padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: widgets);
                });
              }
            default:
              {
                return Container(
                    child: Center(child: Text("Waiting to start loading...")));
              }
          }
        }));
  }
}
