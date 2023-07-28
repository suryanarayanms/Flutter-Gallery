import 'package:flutter/material.dart';

class Apps extends ChangeNotifier {
  final List _apptile = [
    [
      "Tamil Meme Templates",
      "Choose a template, download it and make a meme out of it",
      "1k",
      'lib/images/meme.png',
      'https://play.google.com/store/apps/details?id=com.ceosurya.tamilmemetemplates&gl=US',
      'INSTALL',
      Colors.black
    ],
    [
      "Stack Notes",
      "Organize task and remember stuff",
      "  ",
      'lib/images/stack.jpg',
     'https://play.google.com/store/apps/details?id=com.ceosurya.todoapp&gl=US',
      'INSTALL',
      Colors.white
    ],
    [
      "SaKo",
      "Burglary prevention application for Coimbatore'ians",
      "",
      'lib/images/sako.jpg',
      '',
      '',
      Colors.white
    ],
    [
      "The Pet Project",
      "Know him protect him",
      "  ",
      'lib/images/pet.png',
      'https://play.google.com/store/apps/details?id=com.ceosurya.thepetproject&gl=US',
      'INSTALL',
      Colors.white
    ],
  ];

  get apptile => _apptile;

  // Theme Changer
  bool _theme = true;
  bool get theme => _theme;

  void changeTheme() {
    _theme = !_theme;
    notifyListeners();
  }
}
