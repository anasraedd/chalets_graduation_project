import 'package:chalets/screens/maps_screen.dart';
import 'package:chalets/widgets/MapsDemo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapChaletScreen extends StatefulWidget {
  // const MapChaletScreen({Key? key}) : super(key: key);
  late double latitude;
  late double longitude;


  MapChaletScreen({required this.latitude, required this.longitude});

  @override
  State<MapChaletScreen> createState() => _MapChaletScreenState();
}

class _MapChaletScreenState extends State<MapChaletScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(


          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5), // Shadow color
            //     spreadRadius: 1, // Spread radius
            //     blurRadius: 2, // Blur radius
            //     offset: Offset(0, 0), // Offset in (x,y) direction
            //
            //   ),
            // ],
            // color: Colors.white,

            // borderRadius: BorderRadius.circular(30)
          ),
          margin: EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 30.h),
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: GoogleMap(initialCameraPosition: CameraPosition(target:  LatLng(widget.latitude, widget.longitude),   zoom: 14.4746,),
            mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: MarkerId('user_location'),
                  position:  LatLng(widget.latitude, widget.longitude),
                  infoWindow: InfoWindow(title: 'Your Location'),
                ),
              },
              // circles: {
              //   Circle(
              //     circleId: CircleId('radius'),
              //     // center: _center,
              //     radius: 30,
              //     strokeWidth: 2,
              //     strokeColor: Colors.blue,
              //     fillColor: Colors.blue.withOpacity(0.2),
              //   ),
              // },
            ),
          ),
        ),
        GestureDetector(onTap: (){
    Get.to(MapsScreen(latitude: widget.latitude,  longitude: widget.longitude,));
    }, child: Center(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 30.h),
          ),
    ))
      ],
    );
  }
}
