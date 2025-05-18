import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              // Lancer next_step
            },
            label: Text("Lancer une partie"),
            icon: Icon(
              Icons.power_settings_new_outlined,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
