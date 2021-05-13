import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/controllers/api_controller.dart';

class CharacterName extends StatelessWidget {
  ApiController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TextStyle _headlineStyle = Theme.of(context)
        .textTheme
        .headline6
        .copyWith(fontWeight: FontWeight.bold);
    TextStyle _bodyStyle = Theme.of(context).textTheme.bodyText2;

    return Chip(
      avatar: Icon(
        Icons.star,
        color: Theme.of(context).primaryColorDark,
      ),
      label: buildObx(_headlineStyle),
      elevation: 3,
      labelStyle: _bodyStyle,
      backgroundColor: Theme.of(context).cardColor.withOpacity(0.1),
    );
  }

  Obx buildObx(TextStyle _headlineStyle) {
    return Obx(() => Column(children: [
          Text(_controller.apiModels.value.name.toString(),
              style: _headlineStyle),
          buildRowInfo()
        ]));
  }

  Row buildRowInfo() {
    return Row(
      children: [
        Text(
          _controller.apiModels.value.status.toString(),
        ),
        Text(" & "),
        Text(
          _controller.apiModels.value.species.toString(),
        ),
        Text(" & "),
        Text(
          _controller.apiModels.value.gender.toString(),
        ),
      ],
    );
  }
}
