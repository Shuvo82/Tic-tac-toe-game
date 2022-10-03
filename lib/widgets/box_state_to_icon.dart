import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/box_state.dart';

class BoxStateToIcon extends StatelessWidget {
  final box_name;

  const BoxStateToIcon({Key? key, this.box_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return box_name == BoxState.empty
        ? Container()
        : box_name == BoxState.cross
        ? const Icon(
      Icons.close,
      color: Colors.white,
      size: 90,
    )
        : const Icon(
      Icons.radio_button_unchecked,
      color: Colors.white,
      size: 80,
    );
  }
}