import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/admin/upsert_act.dart';
import 'package:get/get.dart';

class AdminHomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        actions: [
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => Get.to(UpsertActUI()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
