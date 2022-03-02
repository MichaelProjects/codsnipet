import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            height: 40,
            width: 40,
            child: CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey,
            )),
        const SizedBox(width: 15),
        const Text("Max Mustermann"),
        IconButton(onPressed: () {}, icon: const Icon(Coolicons.caret_down))
      ],
    );
  }
}
