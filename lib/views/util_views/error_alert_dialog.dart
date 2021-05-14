import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/views/home_views/home_page.dart';

Future buildShowDialog(BuildContext context, String errorName) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error: "),
          content: Text(errorName),
          actions: [
            TextButton(
                child: Text("Close"),
                onPressed: () {
                  Get.off(() => HomePage());
                })
          ],
        );
      });
}
