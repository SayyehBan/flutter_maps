// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_maps/Controller/OperationButtonController.dart';
import 'package:flutter_maps/components/getBackPage.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final controller = Get.put(OperationButtonController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        //OSM Map
        Container(
          color: Colors.blueGrey,
        ),
        Obx(() => controller.currentWidget),
        Obx(
          () => controller.currentWidgetLists.length != 1
              ? GetBackPage(
                  onPressed: () {
                    if (controller.currentWidgetLists.length > 1) {
                      controller.currentWidgetLists.removeLast();
                    }
                  },
                )
              : const SizedBox(),
        ),
      ]),
    ));
  }
}
