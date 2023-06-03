import 'package:flutter/material.dart';
import '../../core/store/config.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text("ToDo app"),
          ElevatedButton(
              onPressed: () {
                ConfigStore.to.saveAlreadyOpen();
              },
              child: Text("Go to signin"))
        ],
      ),
    ));
  }
}
