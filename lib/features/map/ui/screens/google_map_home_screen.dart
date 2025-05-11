import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
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

  @override
  void initState() {
    super.initState();
    _listenCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    if (await _checkPermission()) {
      if (await _isGpsEnabled()) {
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
          ),
        );
        print("CURRENT POSITION: $_currentPosition");
        setState(() {});
      } else {
        await _requestGpsService();
      }
    } else {
      _requestPermission();
    }
  }

  Future<void> _listenCurrentLocation() async {
    if (await _checkPermission()) {
      if (await _isGpsEnabled()) {
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            timeLimit: Duration(seconds: 1),
          ),
        ).listen((Position position) {
          print("STREAM POSITION: $position");
        });
      } else {
        await _requestGpsService();
      }
    } else {
      _requestPermission();
    }
  }

  Future<bool> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<bool> _isGpsEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _requestGpsService() async {
    await Geolocator.openLocationSettings();
  }

  // 🔗 Share Location Method
  Future<void> _shareLocation() async {
    await _getCurrentLocation();
    if (_currentPosition != null) {
      final latitude = _currentPosition!.latitude;
      final longitude = _currentPosition!.longitude;

      final String mapUrl =
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

      final String message = "📍 My Location:\n$mapUrl";

      Share.share(message);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location not found')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'locate',
            onPressed: _getCurrentLocation,
            child: Icon(Icons.location_searching, color: AppColors.primaryColor),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'share',
            onPressed: _shareLocation,
            child: Icon(Icons.share, color: AppColors.primaryColor),
          ),
        ],
      ),
      appBar: CustomAppBar(
        title: "Google Map",
        leadingWidget: CustomIcon(),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: const MapOptions(
              initialCenter: LatLng(25.634368995091165, 88.58862597495317),
              initialZoom: 2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                maxZoom: 19,
              ),
              CurrentLocationLayer(
                style: LocationMarkerStyle(
                  marker: DefaultLocationMarker(
                    child: Icon(Icons.location_on, color: AppColors.primaryColor),
                  ),
                  markerDirection: MarkerDirection.heading,
                  markerSize: const Size(40, 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
