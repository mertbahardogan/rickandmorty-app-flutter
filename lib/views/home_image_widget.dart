import 'package:flutter/material.dart';

class HomeImageWidget extends StatelessWidget {
  final int imageNumber;
  HomeImageWidget({@required this.imageNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildGrid(context),
    );
  }

  Widget buildGrid(BuildContext context) {
    return Container(
      child: buildClipRRect(),
      decoration: buildBoxDecoration(),
    );
  }

  ClipRRect buildClipRRect() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Image.asset(
        "assets/images/home/main$imageNumber.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 10.0,
          offset: Offset(1, 1),
        ),
      ],
    );
  }
}
