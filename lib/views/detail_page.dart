import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';
import 'package:rick_and_morty_app/views/detail_bottom_container.dart';
import 'package:rick_and_morty_app/views/detail_char_image.dart';
import 'package:rick_and_morty_app/views/detail_char_name.dart';

class DetailPage extends StatelessWidget {
  final String charName;
  DetailPage({@required this.charName});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 1,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              CharacterImage(),
              Positioned(
                top: 20,
                left: 10,
                child: buildIconContainer(context),
              ),
              Positioned(
                top: 20,
                right: 10,
                child: CharacterName(charName),
              ),
              Positioned(
                left: 15,
                right: 15,
                bottom: 20,
                child: BottomContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildIconContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: buildIconButton(context),
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.only(left: 5),
        iconSize: context.dynamicWidth(4),
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          Get.back();
        });
  }
}
