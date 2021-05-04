import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/extensions/divider_container.dart';
import 'package:rick_and_morty_app/views/cards_widget.dart';
import 'package:rick_and_morty_app/views/home_image_widget.dart';
import 'package:rick_and_morty_app/views/search_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildColumn(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildColumn(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    onPageChanged(int page) {
      print("Current Page: " + page.toString());
      int previousPage = page;
      if (page != 0)
        previousPage--;
      else
        previousPage = 2;
      print("Previous page: $previousPage");
    }

    return Column(
      children: [
        buildTitleImage(),
        Expanded(flex: 2, child: SearchWidget()),
        Expanded(flex: 4, child: buildPageView(controller, onPageChanged)),
        Expanded(flex: 1, child: buildDividers(context)),
        Expanded(flex: 5, child: CardWidget()),
      ],
    );
  }

  Widget buildTitleImage() {
    return SafeArea(
      child: Image.asset(
        "assets/images/logo.png",
        width: 130,
        fit: BoxFit.contain,
      ),
    );
  }

  PageView buildPageView(PageController controller, onPageChanged) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: [
        HomeImageWidget(imageNumber: 1),
        HomeImageWidget(imageNumber: 2),
        HomeImageWidget(imageNumber: 3),
        HomeImageWidget(imageNumber: 4),
      ],
    );
  }

  Widget buildDividers(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DividerContainer(
              color: Theme.of(context).accentColor, height: 0.7, width: 8),
          DividerContainer(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              height: 0.7,
              width: 4),
          DividerContainer(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              height: 0.7,
              width: 3),
          DividerContainer(
              color: Theme.of(context).accentColor.withOpacity(0.2),
              height: 0.7,
              width: 3),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(context) {
    return FloatingActionButton(
      child: Icon(
        Icons.settings,
        color: Theme.of(context).hoverColor,
      ),
      backgroundColor: Theme.of(context).hintColor,
      mini: true,
      elevation: 0,
      onPressed: () {},
    );
  }
}


