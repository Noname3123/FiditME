import 'package:fidit_me_jakupovic/navdrawer.dart';
import 'package:flutter/material.dart';

/// This stateless widget is the main frame of the app. It contains the app drawer definition and tob bar definition. pages are added under the body of scaffholding
class MainPageFrame extends StatelessWidget {
  //TODO: main page frame should be a stateful widget, since navdrawer onTap loads a new page/ changes the page under MainPageFrame
  const MainPageFrame({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: const Text("Body content"), //TODO: Replace with actual content
      drawer: const NavDrawer(),
    );
  }
}
