import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/controllers.dart';
import 'package:flutter_starter/ui/eventmap_ui.dart';
import 'package:get/get.dart';

class DrawerUI extends StatelessWidget {
  const DrawerUI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Text(authController.firestoreUser.value.name),
          // decoration: BoxDecoration(color: Get.theme.accentColor),
        ),
        ListTile(
          title: Text('Lineup'),
        ),
        ListTile(
          title: Text('Site Map'),
          onTap: () => Get.to(EventMapUI()),
        ),
        Divider(),
        ListTile(
          title: Text('Information'),
        ),
        ListTile(
          title: Text('Contact'),
        ),
        if (authController.admin.value)
          ListTile(
            title: Text('Admin'),
          )
      ]),
    );
  }
}
