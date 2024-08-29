import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///this class inits the sidebar used for navigation.
class NavDrawer extends StatelessWidget {
  ///constructor of this class receives the method  onPageChange which is called when app drawers onTap event is executed. getRole is a method which returns the active role of app
  const NavDrawer(
      {super.key, required this.onPageChange, required this.getRole});

  final Function onPageChange;
  final Function getRole;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          buildDrawerElements(context),
        ],
      ),
    );
  }

  ///this method returns main app drawer elements and adds a padding arround them. the method must receive widgets buildCOntext as param
  Widget buildDrawerElements(BuildContext context) {
    return Wrap(
      runSpacing: 9,
      children: [
        ListTile(
            leading: const Icon(Icons.info),
            title: Text(AppLocalizations.of(context)!.oFakultetu),
            onTap: () {
              rerouteAndCloseDrawer(context, 0);
            }),
        ListTile(
          leading: const Icon(Icons.edit),
          title: Text(AppLocalizations.of(context)!.upisi),
          onTap: () {
            rerouteAndCloseDrawer(context, 1);
          },
        ),
        ListTile(
            leading: const Icon(Icons.school),
            title: Text(AppLocalizations.of(context)!.studiji),
            onTap: () {
              rerouteAndCloseDrawer(context, 2);
            }),
        getRole().hideDinpPage == true
            ? Container()
            : ListTile(
                leading: const Icon(Icons.description),
                title: Text(AppLocalizations.of(context)!.dinpPlanovi),
                onTap: () {
                  rerouteAndCloseDrawer(context, 3);
                }),
        const Divider(),
        ListTile(
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.postavke),
            onTap: () {
              rerouteAndCloseDrawer(context, 4);
            }),
      ],
    );
  }

  ///this method receives the build context of widget and page index. It relads te appropriate page and closes the nav drawer
  void rerouteAndCloseDrawer(BuildContext context, int pageNum) {
    onPageChange(pageNum);
    Navigator.of(context).pop(); //causes to close drawer on select
  }
}
