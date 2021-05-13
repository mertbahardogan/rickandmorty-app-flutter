import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/controllers/api_controller.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';
import 'package:get/get.dart';

class BottomContainer extends StatelessWidget {
  ApiController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(20),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardColor.withOpacity(0.3),
              offset: Offset(1, 1),
              blurRadius: 2.0,
            ),
          ]),
      child: buildBottomContainerColumn(context, _controller),
    );
  }
}

Column buildBottomContainerColumn(BuildContext context, _controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildColumnLocation(context, _controller),
          // buildColumnEpisode(context, _controller),
        ],
      )
    ],
  );
}

Column buildColumnLocation(BuildContext context, _controller) {
  return Column(
    children: [
      Image.asset("assets/icons/location.png", width: context.dynamicWidth(6)),
      Text("Last known location"),
      Obx(() => Text((_controller.apiModels.value.location.name.toString()),
          style: Theme.of(context).textTheme.headline6))
    ],
  );
}

// Column buildColumnEpisode(BuildContext context, _controller) {
//   return Column(
//     children: [
//       Image.asset("assets/icons/episode.png", width: context.dynamicWidth(6)),
//       Text("First seen in"),
//       Obx(() => Text((_controller.apiModels.value.episode.name.toString()),
//           style: Theme.of(context).textTheme.headline6))
//     ],
//   );
// }
