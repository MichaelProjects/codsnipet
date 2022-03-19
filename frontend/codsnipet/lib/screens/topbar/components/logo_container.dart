import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        width: 175,
        height: 50,
        child: Image.asset("img/opensight.png"));
  }
}
