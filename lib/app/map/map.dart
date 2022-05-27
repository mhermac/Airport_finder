import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../database/db.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _next = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.1573, 44.4065),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          GoogleMap(
            markers: {
              Marker(
                  infoWindow:
                      isvisible ? InfoWindow.noText : InfoWindow(title: 'aaa'),
                  position: LatLng(40.1573, 44.4065),
                  markerId: MarkerId('aaa'),
                  icon: BitmapDescriptor.defaultMarker,
                  onTap: () {
                    setState(() {
                      isvisible != isvisible;
                    });
                  }),
              Marker(
                  infoWindow:
                      isvisible ? InfoWindow.noText : InfoWindow(title: 'aaa'),
                  position: LatLng(36.8236, 7.8103),
                  markerId: MarkerId('aaa'),
                  icon: BitmapDescriptor.defaultMarker,
                  onTap: () {
                    setState(() {
                      isvisible != isvisible;
                    });
                   //DB d = DB();
                   // d.openDb();
                  })
            },
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          ElevatedButton(onPressed: _goToTheNext, child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Go to the next',style: TextStyle(
                color:Colors.white ,fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 5,),
              Icon(Icons.location_on,color: Colors.red,)
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Color(0xff0b1527)
          ),)
        ],
      ),
    );
  }

  Future<void> _goToTheNext() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_next));
  }
}
