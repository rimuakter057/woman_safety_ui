import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woman_safety_ui/features/common/widget/custom_appbar.dart';
import '../../../../app/utils/color/app_colors.dart';
import '../../../common/widget/custom_icon.dart';
import '../../../sos_screen/data/models/trustedNumberModel.dart';

class GoogleMapHomeScreen extends StatefulWidget {
  const GoogleMapHomeScreen({super.key});
  static const String name = '/google-map-home-screen';

  @override
  State<GoogleMapHomeScreen> createState() => _GoogleMapHomeScreenState();
}

class _GoogleMapHomeScreenState extends State<GoogleMapHomeScreen> {
  MapController mapController = MapController();
  Position? _currentPosition;
  List<TrustedContactModel> trustedContacts = [];
  List<Marker> _markers = []; // ✅ marker list

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

        LatLng currentLatLng = LatLng(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        );

        setState(() {
          // ✅ Move camera with zoom
          mapController.move(currentLatLng, 18.0);

          // ✅ Add marker
          MarkerLayer(
            markers: [
              Marker(
                width: 60.0,
                height: 60.0,
                point: currentLatLng,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          );

        });
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

  // Share Location Method
  Future<void> _shareLocation() async {
    await _getCurrentLocation();
    if (_currentPosition != null) {
      final latitude = _currentPosition!.latitude;
      final longitude = _currentPosition!.longitude;

      final String mapUrl =
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

      final String message = "My Location:\n$mapUrl";

      Share.share(message);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location not found')),
      );
    }
  }

  Future<void> sendMessagesWithLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> trustedNumbers = prefs.getStringList('trusted_numbers') ?? [];
    print("Trusted: $trustedNumbers");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String mapLink =
        "https://www.google.com/maps?q=${position.latitude},${position.longitude}";

    for (var number in trustedNumbers) {
      final Uri smsUri = Uri.parse(
          "sms:$number?body=I need help! Here is my location: $mapLink");

      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
      } else {
        print("Could not launch SMS for $number");
      }
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
            child: Icon(Icons.location_searching,
                color: AppColors.primaryColor),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'share',
            onPressed: _shareLocation,
            child: Icon(Icons.share, color: AppColors.primaryColor),
          ),
        ],
      ),
      appBar: const CustomAppBar(
        title: "Google Map",
        leadingWidget: CustomIcon(),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: const MapOptions(
              initialCenter: LatLng(24.85916185626852, 89.77556977392202),
              initialZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                maxZoom: 19,
              ),
              const CurrentLocationLayer(
                style: LocationMarkerStyle(
                  marker: DefaultLocationMarker(
                    child:
                    Icon(Icons.location_on, color: AppColors.primaryColor),
                  ),
                  markerDirection: MarkerDirection.heading,
                  markerSize: Size(40, 40),
                ),
              ),
              MarkerLayer(markers: _markers), // ✅ marker layer added
            ],
          ),
        ],
      ),
    );
  }
}
