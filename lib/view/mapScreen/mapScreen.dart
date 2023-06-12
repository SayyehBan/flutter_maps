// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/components/buttonSelect.dart';
import 'package:flutter_maps/components/getBackPage.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        //OSM Map
        Container(
          color: Colors.blueGrey,
        ),
        ButtonSelect(
          title: "انتخاب مبدا",
          onTap: () {},
        ),
        const GetBackPage(),
      ]),
    ));
  }
}
