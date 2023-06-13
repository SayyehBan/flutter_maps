// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/components/buttonSelect.dart';
import 'package:get/get.dart';

enum CurrentWidgetStates {
  stateSelectOrigin,
  stateSelectDestination,
  stateRequestDriver
}

// Create a class to manage the widget state
class OperationButtonController extends GetxController {
  // Define an observable variable to store the current widget state
  final currentWidgetLists = RxList<CurrentWidgetStates>([
    CurrentWidgetStates.stateSelectOrigin,
  ]);

  // Define a function to update the widget state when the user selects a destination
  void selectDestination() {
    currentWidgetLists.add(CurrentWidgetStates.stateSelectDestination);
  }

  // Define a function to update the widget state when the user requests a driver
  void requestDriver() {
    currentWidgetLists.add(CurrentWidgetStates.stateRequestDriver);
  }

  // Define a computed property to get the current widget based on the current state
  Widget get currentWidget {
    switch (currentWidgetLists.last) {
      case CurrentWidgetStates.stateSelectOrigin:
        return ButtonSelect(
          title: "انتخاب مبدا",
          onTap: () => selectDestination(),
        );
      case CurrentWidgetStates.stateSelectDestination:
        return ButtonSelect(
          title: "انتخاب مقصد",
          onTap: () => requestDriver(),
        );
      case CurrentWidgetStates.stateRequestDriver:
        return ButtonSelect(
          title: "درخواست راننده",
          onTap: () {},
        );
      default:
        throw Exception('Unknown widget state!');
    }
  }
}
