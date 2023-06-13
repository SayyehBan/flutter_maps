// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_maps/utilities/dimens.dart';
import 'package:flutter_maps/utilities/textStyles.dart';

class ButtonSelect extends StatelessWidget {
  const ButtonSelect({
    super.key,
    required this.title,
    required this.onTap,
    required this.distance,
    required this.origainAddress,
    required this.destinationAddrres,
  });
  final String title;
  final String distance;
  final String origainAddress;
  final String destinationAddrres;
  final GestureCancelCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.large),
        child: Column(
          children: [
            distance != '0'
                ? Container(
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.medium),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      distance,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                : const SizedBox(),
            const SizedBox(
              height: Dimens.small,
            ),
            origainAddress != '0'
                ? Container(
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.medium),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      origainAddress,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                : const SizedBox(),
            const SizedBox(
              height: Dimens.small,
            ),
            destinationAddrres != '0'
                ? Container(
                    height: 58,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.medium),
                        color: Colors.white),
                    child: Center(
                        child: Text(
                      destinationAddrres,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                : const SizedBox(),
            const SizedBox(
              height: Dimens.small,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onTap,
                  child: Text(
                    title,
                    style: MyTextSyles.bottom,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
