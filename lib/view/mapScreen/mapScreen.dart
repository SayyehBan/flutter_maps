// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_maps/Controller/showMapController.dart';
import 'package:flutter_maps/components/getBackPage.dart';
import 'package:flutter_maps/gen/assets.gen.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final showMapController = Get.put(ShowMapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        //OSM Ma
        SizedBox.expand(
          child: OSMFlutter(
            controller: showMapController.mapController,
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
                    iconWidget: Obx(
              () => SvgPicture.asset(
                showMapController.markerIcon.value,
                height: 100,
                width: 40,
              ),
            ))),
          ),
        ),

        Obx(() => showMapController.currentWidget),
        Obx(
          () => showMapController.currentWidgetLists.length != 1
              ? GetBackPage(
                  onPressed: () {
                    showMapController.backButton();
                  },
                )
              : const SizedBox(),
        ),
      ]),
    ));
  }
}
