import 'package:flutter/material.dart';
import 'package:smart_home/Models/room.dart';

class Rooms with ChangeNotifier {
  static final Rooms _singleton = Rooms._internal();
  Rooms._internal();
  factory Rooms() => _singleton;

  List rooms = [
    "Saloon",
    "Kitchen",
    "Living Room",
    "Bed Room",
    "Child Room",
    "Bathroom"
  ];

  Room getRoom(String name) {
    return _items[rooms.indexOf(name)];
  }

  List<Room> _items = [
    Room(
        name: "Saloon",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
    Room(
        name: "Kitchen",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
    Room(
        name: "Living Room",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
    Room(
        name: "Bed Room",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
    Room(
        name: "Child Room",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
    Room(
        name: "Bathroom",
        isDoorLocked: false,
        isDoorOpen: false,
        isLightOn: false,
        isWindowOpen: false,
        temp: 25),
  ];

  void incTemp(String name) {
    getRoom(name).incTemp();
    notifyListeners();
  }

  void decTemp(String name) {
    getRoom(name).decTemp();
    notifyListeners();
  }

  void openDoor(String name) {
    getRoom(name).openDoor();
    notifyListeners();
  }

  void closeDoor(String name) {
    getRoom(name).closeDoor();
    notifyListeners();
  }

  void lockDoor(String name) {
    getRoom(name).lockDoor();
    notifyListeners();
  }

  void unlockDoor(String name) {
    getRoom(name).unlockDoor();
    notifyListeners();
  }

  void openWindow(String name) {
    getRoom(name).openWindow();
    notifyListeners();
  }

  void closeWindow(String name) {
    getRoom(name).closeWindow();
    notifyListeners();
  }

  void turnOnLights(String name) {
    getRoom(name).turnOnLights();
    notifyListeners();
  }

  void turnOffLights(String name) {
    getRoom(name).turnOffLights();
    notifyListeners();
  }
}
