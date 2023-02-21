import 'package:codsnipet/controller/code_controller.dart';
import 'package:codsnipet/controller/crud_code.dart';
import 'package:codsnipet/utils/customer_color.dart';
import 'package:codsnipet/utils/model/code_snipets.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:provider/provider.dart';

class CodeSnipets extends StatelessWidget {
  CodeSnip data;
  CodeSnipets(this.data, {Key? key}) : super(key: key);
  double width = 400;
  double height = 400;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FetchController fetchController = Provider.of<FetchController>(context);
    CRUDController crudController = Provider.of<CRUDController>(context);

    Widget details = Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 5),
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? null
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 0)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(children: [
              Container(
                  width: width * 0.75,
                  margin: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    data.title,
                    style: TextStyle(fontSize: 14, letterSpacing: 0.4),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            child: GestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                          ClipboardData(text: data.code))
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Code copied to clipboard")));
                                  }); //
                                },
                                child: Center(
                                    child: Icon(
                                  Coolicons.copy,
                                  color: CustomColor.green,
                                ))),
                          ))))
            ]),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 25,
                        child: Wrap(children: string2Chip(data.tags)))),
                FittedBox(
                    child: Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text(data.language)],
                        ))),
              ],
            )
          ],
        ));
    Widget codePreview = Expanded(
        child: Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: SingleChildScrollView(
                child: Expanded(
                    child: HighlightView(
              // The original code to be highlighted
              data.code,

              // Specify language
              // It is recommended to give it a value for performance
              language: data.language,

              // Specify highlight theme
              // All available themes are listed in `themes` folder
              theme: themeMap[Theme.of(context).brightness == Brightness.light
                  ? "a11y-light"
                  : "tomorrow-night"]!,
              // Specify padding
              padding: EdgeInsets.all(12),

              // Specify text style
              textStyle: TextStyle(
                fontFamily: 'My awesome monospace font',
                fontSize: 15,
              ),
            )))));

    Future<void> _onPointerDown(event) async {
      // Check if right mouse button clicked
      if (event.kind == PointerDeviceKind.mouse &&
          event.buttons == kSecondaryMouseButton) {
        final overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        final menuItem = await showMenu<int>(
            context: context,
            items: [
              PopupMenuItem(child: Text('Delete'), value: 1),
            ],
            position: RelativeRect.fromSize(
                event.position & Size(48.0, 48.0), overlay.size));
        // Check if menu item clicked
        switch (menuItem) {
          case 1:
            await crudController.deleteCode(data.id);
            if (crudController.curd == CURDState.idle) {
              fetchController.removeCode(data.id);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Deleted codesnippet'),
                behavior: SnackBarBehavior.floating,
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('An error occured'),
                behavior: SnackBarBehavior.floating,
              ));
            }
            break;
          default:
        }
      }
    }

    return Listener(
        onPointerDown: _onPointerDown,
        child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [codePreview, details],
            )));
  }
}

List<Widget> string2Chip(List<String> data) {
  List<Widget> chips = [];
  for (var i in data) {
    chips.add(Chip(
      backgroundColor: CustomColor.chipBackground,
      label: Text(i,
          style: TextStyle(
              color: CustomColor.green,
              fontSize: 10,
              fontWeight: FontWeight.bold)),
    ));
  }
  return chips;
}
