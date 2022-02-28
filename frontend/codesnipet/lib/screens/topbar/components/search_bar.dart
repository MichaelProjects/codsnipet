import 'dart:async';

import 'package:codesnipet/controller/search_controller.dart';
import 'package:codesnipet/screens/create_snipets/create_snipet.dart';
import 'package:codesnipet/utils/customer_color.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchbarComponent extends StatefulWidget {
  SearchbarComponent({Key? key}) : super(key: key);

  @override
  State<SearchbarComponent> createState() => _SearchbarComponentState();
}

class _SearchbarComponentState extends State<SearchbarComponent> {
  TextEditingController _controller = new TextEditingController();

  Timer searchTimeout = new Timer(Duration.zero, () {});

  _onChangeHandler(value) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchTimeout != null) {
      setState(() => searchTimeout.cancel()); // clear timer
    }
    setState(() => searchTimeout = new Timer(duration, () => search(value)));
  }

  search(value) {
    print('hello world from search . the value is $value');
  }

  @override
  Widget build(BuildContext context) {
    SearchController searchController = Provider.of<SearchController>(context);
    var inputDecoration = InputDecoration(
        border: InputBorder.none,
        hintText: "Enter searchterm. (eg: title, tag)",
        icon: searchController.state == SearchState.searching
            ? CircularProgressIndicator()
            : Icon(Coolicons.search));
    var data = MediaQuery.of(context).size;

    Widget createSnipet = Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: CustomColor.chipBackground,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Center(
            child: InkWell(
                onHover: (value) {},
                onTap: () {
                  print("create new snipet");
                  showDialog(
                      context: context, builder: (context) => CreateSnipets());
                },
                child: Center(
                    child: Icon(Coolicons.plus_circle_outline,
                        color: CustomColor.green)))));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            width: data.width * 0.44,
            height: 50,
            child: Center(
                child: TextField(
              controller: _controller,
              onChanged: _onChangeHandler,
              decoration: inputDecoration,
            ))),
        createSnipet,
      ],
    );
  }
}
