import 'package:flutter/material.dart';

///this class inits the sidebar used for navigation
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          buildDrawerElements(),
        ],
      ),
    );
  }

  ///this method returns main app drawer elements and adds a padding arround them
  Widget buildDrawerElements() {
    return Wrap(
      runSpacing: 9,
      children: [
        ListTile(
            leading: const Icon(Icons.info),
            title: const Text("O fakultetu"),
            onTap: () {}),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text("Upisi"),
          onTap: () {}, //TODO: fully implement onTap "functions"
        ),
        ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Studiji"),
            onTap: () {}),
        ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Izvedbeni planovi"),
            onTap: () {}),
        const Divider(),
        ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Postavke"),
            onTap: () {}),
      ],
    );
  }
}
