import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:fidit_me_jakupovic/navdrawer.dart';
import 'package:fidit_me_jakupovic/pages/about.dart';
import 'package:fidit_me_jakupovic/pages/dinps.dart';
import 'package:fidit_me_jakupovic/pages/enroll.dart';
import 'package:fidit_me_jakupovic/pages/role_select_popup.dart';
import 'package:fidit_me_jakupovic/pages/settings.dart';
import 'package:fidit_me_jakupovic/pages/studies.dart';
import 'package:flutter/material.dart';

/// This stateful widget is the main frame of the app. It contains the app drawer definition and tob bar definition. pages are added under the body of scaffholding
class MainPageFrame extends StatefulWidget {
  ///constructor of main page, which requuires title of app and a map of all functions which may be required to be passed on to widget children (subpages) and are called as events
  const MainPageFrame(
      {super.key, required this.title, required this.passedFunctionsList});

  final String title;

  /// a map of all functions
  final FunctionsList passedFunctionsList;

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPageFrame> {
  ///list of all possible subpages. It is created in initState override
  var allPagesList = [];
  Widget currentPage = const AboutPage();

  @override
  void initState() {
    allPagesList = [
      const AboutPage(),
      const EnrollPage(),
      const StudiesPage(),
      const DinpsPage(),
      SettingsPage(passedFunctionsList: widget.passedFunctionsList)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: widget.passedFunctionsList.getRole!() == null
          ? RoleDialog(
              passedFunctionList: widget.passedFunctionsList,
              shouldHideCancelButton: true,
            ) //if no role selected, show only role select page with the cancel button hidden
          : currentPage,
      drawer: widget.passedFunctionsList.getRole!() == null
          ? null
          : NavDrawer(
              onPageChange: changePage, //hide navdrawer if no role selected
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
