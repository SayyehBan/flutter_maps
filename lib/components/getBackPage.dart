// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/utilities/dimens.dart';
import 'package:get/get.dart';

class GetBackPage extends StatelessWidget {
  const GetBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Get.previousRoute.isNotEmpty
        ? Positioned(
            top: Dimens.medium,
            right: Dimens.medium,
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 3),
                        blurRadius: 18)
                  ]),
              child: IconButton(
                  onPressed: () {
                    if (Get.previousRoute.isNotEmpty) {
                      Get.back();
                    }
                  },
                  icon: const Icon(Icons.arrow_back)),
            ))
        : const SizedBox();
  }
}
