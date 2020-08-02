import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String name;
  final int index;
  final int selectedRoom;

  RowItem(this.name, this.index, this.selectedRoom);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index == selectedRoom ? Colors.indigoAccent : Colors.white,
      ),
      child: Text(
        name,
        style: TextStyle(
            color: index == selectedRoom ? Colors.white : Colors.black),
      ),
    );
  }
}
