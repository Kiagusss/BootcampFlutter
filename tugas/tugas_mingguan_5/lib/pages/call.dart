part of '../main.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: CustomText(text: "Pindah Ke Chat"),
        ),
      ),
    );
  }
}
