import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Models/room.dart';
import 'package:smart_home/contollers/rooms_controller.dart';

class WindowCard extends StatefulWidget {
  final String name;

  WindowCard(this.name);

  @override
  _WindowCardState createState() => _WindowCardState();
}

class _WindowCardState extends State<WindowCard> {
  @override
  Widget build(BuildContext context) {
    Room room = Provider.of<Rooms>(context).getRoom(widget.name);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.pink.withOpacity(0.4),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            room.isWindowOpen
                ? "assets/icons/window_open.svg"
                : "assets/icons/window_close.svg",
            height: size.height * 0.12,
            width: size.width * 0.07,
          ),
          Spacer(),
          RaisedButton(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.cyan,
            textColor: Colors.black,
            onPressed: () {
              if (Rooms().getRoom(widget.name).isWindowOpen) {
                Rooms().closeWindow(widget.name);
              } else {
                Rooms().openWindow(widget.name);
              }
            },
            child: Text(room.isWindowOpen ? "Close Window" : "Open Window"),
          )
        ],
      ),
    );
  }
}
