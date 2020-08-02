import 'package:flutter/material.dart';
import 'package:smart_home/screens/body.dart';
import 'package:smart_home/widgets/TabsRow.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List rooms = [
    "Saloon",
    "Kitchen",
    "Living Room",
    "Bed Room",
    "Child Room",
    "Bathroom"
  ];
  int selectedRoom = 0;

  void changeRoom(index) {
    setState(() {
      selectedRoom = index;
    });
  }

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: rooms.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.home,
          color: Colors.black,
          size: size.width * 0.1,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Smart Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          const IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: null),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.01),
          TabBar(
            onTap: (index) {
              changeRoom(index);
            },
            labelPadding: const EdgeInsets.all(5),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            controller: _tabController,
            tabs: List.generate(
              rooms.length,
              (index) => Tab(
                child: RowItem(
                  rooms[index],
                  index,
                  selectedRoom,
                ),
              ),
            ).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Body(rooms[0]),
                Body(rooms[1]),
                Body(rooms[2]),
                Body(rooms[3]),
                Body(rooms[4]),
                Body(rooms[5]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
