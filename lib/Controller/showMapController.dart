// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/components/buttonSelect.dart';
import 'package:flutter_maps/gen/assets.gen.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

enum CurrentWidgetStates {
  stateSelectOrigin,
  stateSelectDestination,
  stateRequestDriver
}

// Create a class to manage the widget state
class ShowMapController extends GetxController {
  // Define an observable variable to store the current widget state
  final currentWidgetLists = RxList<CurrentWidgetStates>([
    CurrentWidgetStates.stateSelectOrigin,
  ]);
  MapController mapController = MapController(
      initPosition: GeoPoint(latitude: 35.652903, longitude: 51.059940));
  final geoPoints = RxList<GeoPoint>(<GeoPoint>[]);
  RxString markerIcon = Assets.icons.origin.obs;

  // Define a function to update the widget state when the user selects a destination
  void selectDestination() async {
    GeoPoint originGeoPoint =
        await mapController.getCurrentPositionAdvancedPositionPicker();
    debugPrint(
        "latitude : ${originGeoPoint.latitude} longitude : ${originGeoPoint.longitude}");
    geoPoints.add(originGeoPoint);

    currentWidgetLists.add(CurrentWidgetStates.stateSelectDestination);
    markerIcon.value = Assets.icons.destination;

    mapController.init();
  }

  void backButton() {
    if (geoPoints.isNotEmpty) {
      geoPoints.removeLast();
      markerIcon.value = Assets.icons.origin;
      mapController.init();
    }
    if (currentWidgetLists.length > 1) {
      currentWidgetLists.removeLast();
    }
    if (currentWidgetLists.length == 1) {
      markerIcon.value = Assets.icons.origin;
      mapController.init();
    }
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
