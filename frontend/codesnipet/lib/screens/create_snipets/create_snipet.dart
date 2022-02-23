import 'package:flutter/material.dart';

class CreateSnipets extends StatefulWidget {
  CreateSnipets({Key? key}) : super(key: key);

  @override
  State<CreateSnipets> createState() => _CreateSnipetsState();
}

class _CreateSnipetsState extends State<CreateSnipets> {
  TextEditingController language = new TextEditingController();
  TextEditingController code = new TextEditingController();
  TextEditingController title = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    InputDecoration decoration(String hint) {
      return InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    Widget textField(
        InputDecoration decoration, TextEditingController controller) {
      return Container(
          height: 50,
          width: 400,
          child: TextField(
            decoration: decoration,
            controller: controller,
          ));
    }

    return Container(
        height: size.height * 0.6,
        width: size.width * 0.6,
        child: Column(
          children: [
            textField(decoration("Language"), language),
            textField(decoration("Title"), title),
            textField(decoration("Code"), code),
            RaisedButton(
              child: Text("Create"),
              onPressed: () {
                print(language.text);
                print(title.text);
                print(code.text);
              },
            ),
          ],
        ));
  }
}
