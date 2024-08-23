import 'package:fidit_me_jakupovic/navdrawer.dart';
import 'package:fidit_me_jakupovic/pages/about.dart';
import 'package:fidit_me_jakupovic/pages/dinps.dart';
import 'package:fidit_me_jakupovic/pages/enroll.dart';
import 'package:fidit_me_jakupovic/pages/settings.dart';
import 'package:fidit_me_jakupovic/pages/studies.dart';
import 'package:flutter/material.dart';

/// This stateful widget is the main frame of the app. It contains the app drawer definition and tob bar definition. pages are added under the body of scaffholding
class MainPageFrame extends StatefulWidget {
  const MainPageFrame({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPageFrame> {
  ///list of all possible subpages
  var allPagesList = [
    const aboutPage(),
    const EnrollPage(),
    const StudiesPage(),
    const DinpsPage(),
    const SettingsPage()
  ];
  Widget currentPage = const aboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: currentPage,
      drawer: NavDrawer(
        onPageChange: changePage,
      ),
    );
  }

  ///this method changes the current page. It is a void method. PageNum param is int and represents the index of page
  void changePage(int pageNum) {
    setState(() {
      if (pageNum > 0 && pageNum < allPagesList.length) {
        currentPage = allPagesList[pageNum];
      } else {
        currentPage = allPagesList[0];
      }
    });
  }
}
