import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.home,
            size: 50,
          ),
        ],
      ),
    );
  }
}
