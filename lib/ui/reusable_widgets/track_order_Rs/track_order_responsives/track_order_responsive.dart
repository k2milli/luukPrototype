import 'package:flutter/material.dart';

class Responsives {
  //main track page
  static double toolbarHeight = 70;
  static double containerHeightTN;
  //
  static double iconContainerWidth;
  static double iconSize;

  //label text
  static double labelTextSize = 16;
  static double titleTextSize = 20;

  //TrackOrderTN
  static double labelTextSizeTN = 20;
  static double titleTextSizeTN = 18;

  //progressTile Height
  static double progressTileHeight;

  static void makeFlexible(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth <= 480) {
      iconContainerWidth = 60;
      iconSize = 40;

      //label text progress tile child
      labelTextSize = 12;
      titleTextSize = 16;

      //main track page
      toolbarHeight = 50;
      containerHeightTN = deviceWidth * .2;

      //TrackOrderTN
      labelTextSizeTN = 15;
      titleTextSizeTN = 13;

      //progressTileHeight
      progressTileHeight = deviceWidth * .25;
    } else if (deviceWidth >= 480 && deviceWidth <= 650) {
      iconContainerWidth = 80;
      iconSize = 60;
      containerHeightTN = deviceWidth * .3;

      //label text progress tile child
      labelTextSize = 16;
      titleTextSize = 20;

      //TrackOrderTN
      labelTextSizeTN = 20;
      titleTextSizeTN = 18;

      //progressTileHeight
      progressTileHeight = deviceWidth * .25;
    } else if (deviceWidth >= 700) {
      ////////For bigger Screen size
      iconContainerWidth = 150;
      iconSize = 80;
      containerHeightTN = deviceWidth * .2;

      //label text progress tile child
      labelTextSize = 20;
      titleTextSize = 28;

      //TrackOrderTN
      labelTextSizeTN = 28;
      titleTextSizeTN = 20;

      //progressTileHeight
      progressTileHeight = deviceWidth * .18;
    }
  }
}
