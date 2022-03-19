import 'package:codsnipet/screens/settings/settings.dart';
import 'package:codsnipet/utils/customer_color.dart';
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';

import 'components/logo_container.dart';
import 'components/profile.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    Widget settings = Container(
        margin: EdgeInsets.all(10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
        ),
        child: Center(
            child: InkWell(
                onHover: (value) {},
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SetttingsScreen());
                },
                child: Center(
                    child:
                        Icon(Coolicons.settings, color: CustomColor.green)))));
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor),
        width: size.width,
        height: 70,
        child: Row(
          children: [
            //const LogoContainer(),
            Expanded(child: Container()),
            settings,
            const Profile()
          ],
        ));
  }
}
