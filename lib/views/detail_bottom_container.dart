import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';


class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(30),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardColor.withOpacity(0.3),
              offset: Offset(1, 1),
              blurRadius: 2.0,
            ),
          ]),
      child: buildBottomContainerColumn(context),
    );
  }
}

Column buildBottomContainerColumn(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildIconSpecies(context),
      buildTextSpecies(context),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildColumnLocation(context),
          buildColumnEpisode(context),
        ],
      )
    ],
  );
}

Image buildIconSpecies(BuildContext context) {
  return Image.asset("assets/icons/species.png",
      width: context.dynamicWidth(9));
}

Text buildTextSpecies(BuildContext context) {
  return Text(
    "Alive - Human",
    style: Theme.of(context)
        .textTheme
        .headline5
        .copyWith(fontWeight: FontWeight.bold),
  );
}

Column buildColumnLocation(BuildContext context) {
  return Column(
    children: [
      Image.asset("assets/icons/location.png", width: context.dynamicWidth(6)),
      Text("Last known location"),
      Text("Citadel of Ricks", style: Theme.of(context).textTheme.headline6)
    ],
  );
}

Column buildColumnEpisode(BuildContext context) {
  return Column(
    children: [
      Image.asset("assets/icons/episode.png", width: context.dynamicWidth(6)),
      Text("First seen in"),
      Text("Never Ricking Morty", style: Theme.of(context).textTheme.headline6)
    ],
  );
}
