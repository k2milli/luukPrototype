import 'package:flutter/material.dart';
import '../../../ui/customs/custom_painter.dart';
import 'track_order_responsives/track_order_responsive.dart';

class TrackOrderProgressTile extends StatefulWidget {
  final Widget child;
  //removes the custom line from the first track
  final bool firstTrack;

  //
  final bool isDisabled;

  //isCompleted can be toggled according to status or progress i.e if order still processing set iscompleted = false and true if processed
  final bool isCompleted;

  const TrackOrderProgressTile(
      {Key key,
      this.child,
      this.firstTrack = false,
      this.isCompleted = true,
      this.isDisabled = false})
      : super(key: key);
  @override
  _TrackOrderProgressTileState createState() => _TrackOrderProgressTileState();
}

class _TrackOrderProgressTileState extends State<TrackOrderProgressTile> {
  Color dotColor() {
    if (widget.isCompleted == true) {
      return Color(0xFFdd3c36);
    } else if (widget.isDisabled == true) {
      return Color(0xFFdddddd);
    }
    return Color(0xFF1e5aa2);
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.shortestSide * .25;
    Responsives.makeFlexible(context);
    return Row(
      children: [
        Column(
          children: [
            widget.firstTrack == true
                ? Container()
                : CustomPaint(
                    // size: Size(0, 0),
                    painter: MyCustomPaint(
                      isDisabled: widget.isDisabled,
                      height: Responsives.progressTileHeight,
                    ),
                    // child: Text("emirdilony"),
                  ),
            SizedBox(height: 5),
            Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: dotColor(),
                    borderRadius: BorderRadius.circular(50))),
          ],
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: Responsives.progressTileHeight,
            width: double.infinity,
            // color: Colors.green, //
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
