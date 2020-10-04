import 'package:flutter/material.dart';
import '../../ui/reusable_widgets/track_order_Rs/track_order_responsives/track_order_responsive.dart';
import './../reusable_widgets/track_order_Rs/track_order_TN.dart';
import './../reusable_widgets/track_order_Rs/track_order_progress_tile.dart';
import './../reusable_widgets/track_order_Rs/track_order_progress_tile_child.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    Responsives.makeFlexible(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: Responsives.toolbarHeight,
        backgroundColor: Color(0xFF20B2AA),
        title: Text("Track Order"),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Center(
              child: Text("Cancel"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            // , for normal
            height: Responsives.containerHeightTN,
            decoration: BoxDecoration(
              color: Color(0xFFf7f7f7),
            ),
            child: Row(
              children: [
                TrackOrderTN(
                  title: "ESTIMATED TIME",
                  label: "30 minutes",
                ),
                ////////
                TrackOrderTN(
                  title: "ORDER NUMBER",
                  label: "#1232020",
                ),
              ],
            ),
          ),

          /////CustomPaint
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
            child: Column(
              children: [
                TrackOrderProgressTile(
                  firstTrack: true,
                  child: TrackOrderProgressTileChild(
                    title: "Order Placed",
                    label: "We have recieved your order",
                    icon: Icons.face,
                  ),
                ),
                // SizedBox(height: deviceWidth * .06),
                TrackOrderProgressTile(
                  child: TrackOrderProgressTileChild(
                    title: "Order Confirmed",
                    label: "Your order has been confirmed",
                    icon: Icons.shopping_basket,
                  ),
                ),
                TrackOrderProgressTile(
                  isCompleted: false,
                  child: TrackOrderProgressTileChild(
                    isCompleted: false,
                    title: "Order Processed",
                    label: "We are preparing your order",
                    icon: Icons.local_dining_outlined,
                  ),
                ),
                TrackOrderProgressTile(
                  isDisabled: true,
                  isCompleted: false,
                  child: TrackOrderProgressTileChild(
                    isDisabled: true,
                    title: "Ready to Pick",
                    label: "Your order is ready to pick",
                    icon: Icons.face,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
