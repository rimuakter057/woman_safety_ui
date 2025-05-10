
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:woman_safety_ui/features/common/widget/custom_appbar.dart';

import '../../../../app/utils/color/app_colors.dart';
import '../../../common/widget/custom_icon.dart';

class GoogleMapHomeScreen extends StatefulWidget {
  const GoogleMapHomeScreen({super.key});
  static const String name = '/google-map-home-screen';

  @override
  State<GoogleMapHomeScreen> createState() => _GoogleMapHomeScreenState();
}

class _GoogleMapHomeScreenState extends State<GoogleMapHomeScreen> {
  MapController mapController = MapController();
  Position? _currentPosition;



  Future <void>  _getCurrentLocation()async{
    if(await _checkPermission()){
      if(await _isGpsEnabled()){
        ///one time
        _currentPosition = await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(
              accuracy: LocationAccuracy.best,

            )
        );
        print("============================================$_currentPosition=============");
        setState(() {

        });
      }else{
        await _requestGpsService();
      }
    }else{
      _requestPermission();
    }
  }
  Future <void>  _listenCurrentLocation()async{
    if(await _checkPermission()){
      if(await _isGpsEnabled()){
        _currentPosition = await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(
              accuracy: LocationAccuracy.best,
            )
        );
        setState(() {

        });
      }else{
        await _requestGpsService();
      }
    }else{
      _requestPermission();
    }
  }
 Future<bool> _checkPermission()async{
   LocationPermission permission= await Geolocator.checkPermission();
   if(permission==LocationPermission.always || permission==LocationPermission.whileInUse){
     return true;
   }
   return false;
 }
Future<bool> _requestPermission()async{
   LocationPermission permission= await Geolocator.requestPermission();
   if(permission ==LocationPermission.whileInUse ||permission== LocationPermission.always){
     return true;
   }
   return false;
}
Future <bool> _isGpsEnabled()async{
   return await Geolocator.isLocationServiceEnabled();
}
Future<void> _requestGpsService()async{
   await Geolocator.openLocationSettings();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: _getCurrentLocation,
        child: Icon(Icons.location_disabled_rounded,color: AppColors.primaryColor,),
      ),
      appBar: CustomAppBar(title: "google map",leadingWidget: CustomIcon(),),
      body: Stack(
        children: [
   FlutterMap(
       mapController: mapController,

       options: MapOptions(
        initialCenter: LatLng(25.634368995091165, 88.58862597495317),
         initialZoom: 2
       ),
       children:[
         TileLayer(
     urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
           maxZoom: 19,
         ),
      CurrentLocationLayer(
        style: LocationMarkerStyle(
          marker: DefaultLocationMarker(
            child: Icon(Icons.location_on,color: AppColors.primaryColor,),
          ),
          markerDirection: MarkerDirection.heading,
          markerSize: const Size(40, 40),
        ),
      ),
       ] ,),
        ],
      ),

    );
  }
}
