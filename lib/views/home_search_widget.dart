import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/views/detail_page.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = context.dynamicHeight(8);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildSearchExpanded(context),
        buildSearchContainer(context, height)
      ],
    );
  }

  Expanded buildSearchExpanded(context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: buildTextField(context),
      ),
    );
  }

  Widget buildTextField(context) {
    return TextField(
      cursorColor: Theme.of(context).focusColor,
      decoration: InputDecoration(
        labelText: "Search character",
        fillColor: Theme.of(context).hintColor,
        filled: true,
      ),
    );
  }

  Expanded buildSearchContainer(context, height) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Hero(
          tag: 1,
          child: Material(
            child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).hintColor,
                ),
                child: buildSearchIconButton(context)),
          ),
        ),
      ),
    );
  }

  Widget buildSearchIconButton(context) {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: Theme.of(context).accentColor,
          size: 27,
        ),
        onPressed: () {
          Get.to(() => DetailPage());
        });
  }
}
