import 'package:flutter/material.dart';

class CharacterName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text("Michael Jenkins"),
      elevation: 5,
      labelStyle: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontWeight: FontWeight.bold),
      backgroundColor: Theme.of(context).cardColor.withOpacity(0.1),
    );
  }
}

