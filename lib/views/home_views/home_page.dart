import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/controllers/network_controller.dart';
import 'package:rick_and_morty_app/extensions/divider_container.dart';
import 'package:rick_and_morty_app/views/home_views/home_cards_widget.dart';
import 'package:rick_and_morty_app/views/home_views/home_image_widget.dart';
import 'package:rick_and_morty_app/views/home_views/home_search_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final NetworkController _controller = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBodyObx(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Obx buildBodyObx(BuildContext context) {
    return Obx(() => _controller.connectionStatus.value == 0
        ? Center(child: Text("There is no internet connection."))
        : buildColumn(context));
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

//FIX THIS
  FloatingActionButton buildFloatingActionButton(context) {
    return FloatingActionButton(
      child: Icon(Icons.settings, color: Theme.of(context).accentColor),
      backgroundColor: Theme.of(context).hintColor,
      mini: true,
      elevation: 0,
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).hintColor,
                title: Center(
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Save",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColorDark),
                      ))
                ],
              );
            });
      },
    );
  }
}
