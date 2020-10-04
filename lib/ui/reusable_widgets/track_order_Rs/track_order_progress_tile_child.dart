import 'package:flutter/material.dart';
import 'track_order_responsives/track_order_responsive.dart';

class TrackOrderProgressTileChild extends StatelessWidget {
  final String title;
  final String label;
  final IconData icon;
  final bool isCompleted;
  final bool isDisabled;

  const TrackOrderProgressTileChild(
      {Key key,
      @required this.title,
      @required this.label,
      this.icon,
      this.isCompleted = true,
      this.isDisabled = false})
      : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    Responsives.makeFlexible(context);
    Color setColor() {
      if (isCompleted != true) {
        return Color(0xFF1e5aa2);
      } else if (isDisabled == true) {
        return Color(0xFFdddddd);
      }
      return Color(0xFF575757);
    }

    return Row(
      children: [
        Container(
          width: Responsives.iconContainerWidth,
          child: Center(
              child: Icon(
            icon,
            size: Responsives.iconSize,
            color: isDisabled != true ? Color(0xFF575757) : Color(0xFFdddddd),
          )),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: setColor(),
                        fontSize: Responsives.titleTextSize,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(label,
                      style: TextStyle(
                        color: setColor(),
                        fontSize: Responsives.labelTextSize,
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
