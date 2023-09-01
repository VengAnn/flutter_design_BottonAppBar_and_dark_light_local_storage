import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChartTap extends StatelessWidget {
  const ChartTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.chart,
            size: 50,
          ),
        ],
      ),
    );
  }
}
