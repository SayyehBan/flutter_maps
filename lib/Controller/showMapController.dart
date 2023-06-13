// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/components/buttonSelect.dart';
import 'package:flutter_maps/gen/assets.gen.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
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
  RxString distance = "در حال محاسبه فاصله ...".obs;
  RxString destinationAddrres = "آدرس مقصد ... ".obs;
  RxString origainAddress = "آدرس مبدا ... ".obs;
  // Define a function to update the widget state when the user selects a destination
  void selectDestination() async {
    GeoPoint originGeoPoint =
        await mapController.getCurrentPositionAdvancedPositionPicker();

    geoPoints.add(originGeoPoint);

    currentWidgetLists.add(CurrentWidgetStates.stateSelectDestination);
    markerIcon.value = Assets.icons.destination;

    mapController.init();
  }

  void getAddress() async {
    try {
      await placemarkFromCoordinates(
              geoPoints.first.latitude, geoPoints.first.longitude)
          .then((List<Placemark> pList) {
        origainAddress.value =
            "${pList.first.street} ${pList.first.thoroughfare} ";
      });

      await placemarkFromCoordinates(
              geoPoints.last.latitude, geoPoints.last.longitude)
          .then((List<Placemark> pList) {
        destinationAddrres.value =
            "${pList.last.street} ${pList.last.thoroughfare} ";
      });
    } catch (e) {
      origainAddress.value = '0';
      destinationAddrres.value = '0';
    }
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
  void requestDriver() async {
    await mapController
        .getCurrentPositionAdvancedPositionPicker()
        .then((value) => geoPoints.add(value));
    await mapController.cancelAdvancedPositionPicker();
    await mapController.addMarker(geoPoints.first,
        markerIcon: MarkerIcon(
          iconWidget: SvgPicture.asset(Assets.icons.origin),
        ));
    await mapController.addMarker(geoPoints.last,
        markerIcon: MarkerIcon(
          iconWidget: SvgPicture.asset(Assets.icons.destination),
        ));
    currentWidgetLists.add(CurrentWidgetStates.stateRequestDriver);
    await distance2point(geoPoints.first, geoPoints.last).then((value) {
      if (value <= 1000) {
        distance.value = "فاصله مبدا تا مقصد ${value.toInt()} متر";
      } else {
        distance.value = "فاصله مبدا تا مقصد ${value ~/ 1000} کیلومتر";
      }
      getAddress();
    });
  }

  // Define a computed property to get the current widget based on the current state
  Widget get currentWidget {
    switch (currentWidgetLists.last) {
      case CurrentWidgetStates.stateSelectOrigin:
        return ButtonSelect(
          title: "انتخاب مبدا",
          onTap: () => selectDestination(),
          distance: '0',
          origainAddress: '0',
          destinationAddrres: '0',
        );
      case CurrentWidgetStates.stateSelectDestination:
        return ButtonSelect(
          title: "انتخاب مقصد",
          onTap: () => requestDriver(),
          distance: '0',
          origainAddress: '0',
          destinationAddrres: '0',
        );
      case CurrentWidgetStates.stateRequestDriver:
        return ButtonSelect(
          title: "درخواست راننده",
          onTap: () {},
          distance: distance.value,
          origainAddress: "مبدا : ${origainAddress.value}",
          destinationAddrres: "مقصد : ${destinationAddrres.value}",
        );
      default:
        throw Exception('Unknown widget state!');
    }
  }
}
