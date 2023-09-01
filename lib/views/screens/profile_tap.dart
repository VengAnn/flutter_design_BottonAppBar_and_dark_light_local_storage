import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.profile,
            size: 50,
          ),
        ],
      ),
    );
  }
}
