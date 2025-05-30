import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        onTap(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Game",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Challenge",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Pledge",
        ),
      ],
    );
  }
}
