import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class WalletTap extends StatelessWidget {
  const WalletTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.wallet,
            size: 50,
          ),
        ],
      ),
    );
  }
}
