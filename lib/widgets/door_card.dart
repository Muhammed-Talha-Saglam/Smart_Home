import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Models/room.dart';
import 'package:smart_home/contollers/rooms_controller.dart';

class DoorCard extends StatefulWidget {
  final String name;

  DoorCard(this.name);

  @override
  _DoorCardState createState() => _DoorCardState();
}

class _DoorCardState extends State<DoorCard> {
  @override
  Widget build(BuildContext context) {
    Room room = Provider.of<Rooms>(context).getRoom(widget.name);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue.withOpacity(0.2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            room.isDoorOpen
                ? "assets/icons/open_door.svg"
                : "assets/icons/closed_door.svg",
            height: size.height * 0.12,
            width: size.width * 0.07,
          ),
          SizedBox(width: size.width * 0.05),
          InkWell(
            onTap: () {
              if (room.isDoorLocked && !room.isDoorOpen) {
                Rooms().unlockDoor(widget.name);
              } else if (!room.isDoorLocked && !room.isDoorOpen) {
                Rooms().lockDoor(widget.name);
              }
            },
            child: SvgPicture.asset(room.isDoorLocked
                ? "assets/icons/lock.svg"
                : "assets/icons/unlock.svg"),
          ),
          Spacer(),
          RaisedButton(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.amber,
            textColor: Colors.black,
            onPressed: () {
              if (Rooms().getRoom(widget.name).isDoorOpen) {
                Rooms().closeDoor(widget.name);
              } else {
                if (!room.isDoorLocked) {
                  Rooms().openDoor(widget.name);
                }
              }
            },
            child: Text(room.isDoorOpen ? "Close Door" : "Open Door"),
          ),
        ],
      ),
    );
  }
}
