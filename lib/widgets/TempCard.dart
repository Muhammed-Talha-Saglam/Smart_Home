import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/Models/room.dart';
import 'package:smart_home/contollers/rooms_controller.dart';

class TempCard extends StatefulWidget {
  final String name;

  TempCard(this.name);

  @override
  _TempCardState createState() => _TempCardState();
}

class _TempCardState extends State<TempCard> {
  double opc = 0.7;

  @override
  Widget build(BuildContext context) {
    Room room = Provider.of<Rooms>(context).getRoom(widget.name);
    Size size = MediaQuery.of(context).size;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: opc,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.deepPurple,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/temp.svg",
              height: size.height * 0.12,
              width: size.width * 0.07,
              color: Colors.red,
            ),
            SizedBox(width: size.width * 0.1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Rooms().decTemp(room.name);
                        if (opc > 0.19 && room.temp < 25) {
                          setState(() {
                            opc -= 0.10;
                          });
                        }
                      },
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: size.width * 0.25),
                      ),
                    ),
                    Text(
                      "${room.temp}",
                      style: TextStyle(fontSize: size.width * 0.15),
                    ),
                    InkWell(
                      onTap: () {
                        Rooms().incTemp(room.name);
                        if (opc < 0.91 && room.temp > 15) {
                          setState(() {
                            opc += 0.10;
                          });
                        }
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: size.width * 0.15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
