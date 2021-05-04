import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';

class CardExtension extends StatelessWidget {
  final String titleText;
  final String cardText;
  final Color color;

  CardExtension(
      {@required this.titleText,
      @required this.cardText,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titleText),
        SizedBox(height: 10),
        buildContainer(context)
      ],
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
        child: Center(
          child: Text(
            cardText,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: buildBoxDecoration(),
        height: context.dynamicHeight(13),
        width: context.dynamicWidth(25));
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 5.0,
          offset: Offset(0.4, 0.4),
        ),
      ],
    );
  }
}
