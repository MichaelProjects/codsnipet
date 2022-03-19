import 'package:codsnipet/controller/code_controller.dart';
import 'package:codsnipet/controller/settings_controller.dart';
import 'package:codsnipet/utils/api/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetttingsScreen extends StatelessWidget {
  const SetttingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController baseUrlController = TextEditingController();
    FetchController fetchController = Provider.of<FetchController>(context);
    var data = MediaQuery.of(context).size;
    baseUrlController.text = Urls.host;
    return AlertDialog(
        title: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: data.height * 0.6,
            width: data.width * 0.6,
            child: Column(
              children: [
                const Center(child: Text("Settings")),
                TextField(
                  controller: baseUrlController,
                  decoration: const InputDecoration(
                      labelText: "Host", hintText: "https://example.com"),
                ),
                Expanded(child: Container(height: 1000)),
                Center(
                  child: TextButton(
                    style: const ButtonStyle(),
                    child: const Text("Update",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      await SettingsStorage()
                          .storeHostUrl(baseUrlController.text.trim());
                      Urls.host = baseUrlController.text.trim();
                      await fetchController.fetchData(30, 0);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Updated BaseUrl")));
                    },
                  ),
                )
              ],
            )));
  }
}
