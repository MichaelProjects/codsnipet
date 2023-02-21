import 'package:codsnipet/controller/code_controller.dart';
import 'package:codsnipet/controller/crud_code.dart';
import 'package:codsnipet/utils/customer_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSnipets extends StatefulWidget {
  CreateSnipets({Key? key}) : super(key: key);

  @override
  State<CreateSnipets> createState() => _CreateSnipetsState();
}

class _CreateSnipetsState extends State<CreateSnipets> {
  TextEditingController language = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CRUDController crudController = Provider.of<CRUDController>(context);
    FetchController fetchController = Provider.of<FetchController>(context);
    var size = MediaQuery.of(context).size;

    InputDecoration decoration(String hint, String labelText) {
      return InputDecoration(
        hintText: hint,
        labelStyle: TextStyle(color: CustomColor.green),
        labelText: labelText,
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.green),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.green),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    Widget textField(
        InputDecoration decoration, TextEditingController controller) {
      return SizedBox(
          height: 50,
          width: 400,
          child: TextField(
            decoration: decoration,
            controller: controller,
          ));
    }

    return AlertDialog(
        title: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 350,
            height: 350,
            child: SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.6,
                child: Column(
                  children: [
                    textField(decoration("eg. Python", "Language"), language),
                    textField(decoration("eg. basic logger", "Title"), title),
                    SizedBox(
                        width: 400,
                        height: 200,
                        child: TextField(
                          controller: code,
                          maxLines: 10,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          decoration: decoration("", "Code"),
                        )),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(CustomColor.green),
                      ),
                      child: const Text("Create"),
                      onPressed: () async {
                        await crudController.createCode(
                            language.text, title.text, code.text, []);
                        if (crudController.curd == CURDState.idle) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Created")));
                          await fetchController.fetchData(30, 0);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Error")));
                        }
                      },
                    ),
                  ],
                ))));
  }
}
