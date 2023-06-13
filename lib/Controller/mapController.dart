// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/gen/assets.gen.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShowMapController extends GetxController {
  final geoPoints = RxList<GeoPoint>(<GeoPoint>[]);

  Widget markerIcon = SvgPicture.asset(
    Assets.icons.origin,
    height: 100,
    width: 40,
  );

  // void addPoint(GeoPoint point) => geoPoints.add(point);

  // void removePoint(int index) => geoPoints.removeAt(index);
}
