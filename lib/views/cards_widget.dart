import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/extensions/card_extension.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildColumn(context),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(context),
        buildPadding(),
      ],
    );
  }

  Text buildText(BuildContext context) {
    return Text(
      "General Information",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardExtension(
            titleText: "Characters",
            cardText: "123",
            color: Colors.yellow.shade900,
          ),
          CardExtension(
            titleText: "Locations",
            cardText: "223",
            color: Colors.yellow.shade800,
          ),
          CardExtension(
            titleText: "Episodes",
            cardText: "876",
            color: Colors.yellow.shade700,
          ),
        ],
      ),
    );
  }
}
