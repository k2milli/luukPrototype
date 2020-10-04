import 'package:flutter/material.dart';
import 'track_order_responsives/track_order_responsive.dart';

class TrackOrderTN extends StatelessWidget {
  final String title;
  final String label;

  const TrackOrderTN({Key key, this.title, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Responsives.makeFlexible(context);
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: Responsives.titleTextSizeTN,
                  color: Color(0xFF575757).withOpacity(0.7)),
            ),
            SizedBox(height: 10),
            Text(label,
                style: TextStyle(
                    fontSize: Responsives.labelTextSizeTN,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF575757)))
          ],
        ),
      ),
    );
  }
}
