import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/widgets/TempCard.dart';
import 'package:smart_home/widgets/door_card.dart';
import 'package:smart_home/widgets/light_card.dart';
import 'package:smart_home/widgets/window_card.dart';

class Body extends StatefulWidget {
  String name;

  Body(this.name);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TempCard(widget.name),
        DoorCard(widget.name),
        WindowCard(widget.name),
        LightCard(widget.name),
      ],
    );
  }
}
