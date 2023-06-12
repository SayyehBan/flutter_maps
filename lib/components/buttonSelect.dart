// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/utilities/dimens.dart';
import 'package:flutter_maps/utilities/textStyles.dart';

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final GestureCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.large),
        child: ElevatedButton(
            onPressed: onTap,
            child: Text(
              title,
              style: MyTextSyles.bottom,
            )),
      ),
    );
  }
}
