// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_maps/Controller/mapController.dart';
import 'package:flutter_maps/Controller/operationButtonController.dart';
import 'package:flutter_maps/components/getBackPage.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final operationButtonController = Get.put(OperationButtonController());
  final showMapController = Get.put(ShowMapController());
  MapController mapController = MapController(
      initPosition:
          GeoPoint(latitude: 35.7367516373, longitude: 51.2911096718));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        //OSM Ma
        SizedBox.expand(
          child: OSMFlutter(
            controller: mapController,
            userTrackingOption: const UserTrackingOption(
              enableTracking: false,
              unFollowUser: false,
            ),
            initZoom: 15,
            isPicker: true,
            mapIsLoading: const SpinKitCircle(
              color: Colors.black,
            ),
            minZoomLevel: 8,
            maxZoomLevel: 18,
            stepZoom: 1,
            markerOption: MarkerOption(
                advancedPickerMarker: MarkerIcon(
              iconWidget: showMapController.markerIcon,
            )),
          ),
        ),

        Obx(() => operationButtonController.currentWidget),
        Obx(
          () => operationButtonController.currentWidgetLists.length != 1
              ? GetBackPage(
                  onPressed: () {
                    if (operationButtonController.currentWidgetLists.length >
                        1) {
                      operationButtonController.currentWidgetLists.removeLast();
                    }
                  },
                )
              : const SizedBox(),
        ),
      ]),
    ));
  }
}
