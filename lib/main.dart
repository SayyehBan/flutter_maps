import 'package:flutter/material.dart';
import 'package:flutter_maps/utilities/dimens.dart';
import 'package:flutter_maps/view/mapScreen/mapScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            fixedSize:
                const MaterialStatePropertyAll(Size(double.infinity, 58)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.medium))),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 150, 238, 96);
              } else {
                return const Color.fromARGB(255, 2, 207, 36);
              }
            })),
      )),
      home:
          Directionality(textDirection: TextDirection.rtl, child: MapScreen()),
    );
  }
}
