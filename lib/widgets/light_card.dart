import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Models/room.dart';
import 'package:smart_home/contollers/rooms_controller.dart';

class LightCard extends StatefulWidget {
  final String name;

  LightCard(this.name);

  @override
  _LightCardState createState() => _LightCardState();
}

class _LightCardState extends State<LightCard> {
  @override
  Widget build(BuildContext context) {
    Room room = Provider.of<Rooms>(context).getRoom(widget.name);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.deepPurple.withOpacity(0.6),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            room.isLightOn
                ? "assets/icons/lights_on.svg"
                : "assets/icons/lights_off.svg",
            height: size.height * 0.12,
            width: size.width * 0.07,
          ),
          Spacer(),
          RaisedButton(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.greenAccent,
            textColor: Colors.black,
            onPressed: () {
              if (Rooms().getRoom(widget.name).isLightOn) {
                Rooms().turnOffLights(widget.name);
              } else {
                Rooms().turnOnLights(widget.name);
              }
            },
            child: Text(room.isLightOn ? "Turn Off" : "Turn On"),
          )
        ],
      ),
    );
  }
}
