import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/material.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(child: CustomText(text: "Pindah Ke Chat")),
      ),
    );
  }
}
