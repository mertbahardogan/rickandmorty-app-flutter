import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/controllers/api_controller.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';

class CharacterImage extends StatelessWidget {
  final ApiController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    print("HEY " + _controller.apiModels.value.image.toString());
    return Obx(
      () => Container(
        height: context.dynamicHeight(100),
        width: context.dynamicWidth(100),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          image: DecorationImage(
              image: NetworkImage(_controller.apiModels.value.image),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
