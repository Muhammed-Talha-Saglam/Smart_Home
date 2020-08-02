class Room {
  String name;
  int temp;
  bool isDoorOpen;
  bool isDoorLocked;
  bool isWindowOpen;
  bool isLightOn;

  Room(
      {this.name,
      this.temp,
      this.isDoorOpen,
      this.isDoorLocked,
      this.isWindowOpen,
      this.isLightOn});

  void incTemp() {
    temp += 1;
  }

  void decTemp() {
    temp -= 1;
  }

  void openDoor() {
    if (!isDoorOpen) {
      isDoorOpen = true;
    }
  }

  void closeDoor() {
    if (isDoorOpen) {
      isDoorOpen = false;
    }
  }

  void lockDoor() {
    if (!isDoorLocked) {
      isDoorLocked = true;
    }
  }

  void unlockDoor() {
    if (isDoorLocked) {
      isDoorLocked = false;
    }
  }

  void openWindow() {
    if (!isWindowOpen) {
      isWindowOpen = true;
    }
  }

  void closeWindow() {
    if (isWindowOpen) {
      isWindowOpen = false;
    }
  }

  void turnOnLights() {
    if (!isLightOn) {
      isLightOn = true;
    }
  }

  void turnOffLights() {
    if (isLightOn) {
      isLightOn = false;
    }
  }
}
