import 'package:flutter/material.dart';

class CharacterName extends StatelessWidget {
  String name;
  CharacterName(String name){
    this.name=name;
  }
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        Icons.star,
        color: Theme.of(context).primaryColorDark,
      ),
      label: Text(name),
      elevation: 5,
      labelStyle: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(fontWeight: FontWeight.bold),
      backgroundColor: Theme.of(context).cardColor.withOpacity(0.1),
    );
  }
}
