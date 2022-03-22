import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/models/address_location.dart';

class MapScreen extends StatefulWidget {
  final AddressLocation initialLocation;
  final bool isSelecting;
  const MapScreen({
    Key? key,
    this.initialLocation = const AddressLocation(
      latitude: 31.0286963,
      longtiude: 31.3933538,
    ),
    this.isSelecting = false,
  }) : super(key: key);

  static const routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(
      () {
        _pickedLocation = position;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit11'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(
                Icons.check,
              ),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longtiude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.initialLocation.latitude,
                        widget.initialLocation.longtiude,
                      ),
                ),
              },
      ),
    );
  }
}
