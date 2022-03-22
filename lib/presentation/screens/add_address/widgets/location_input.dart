import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/helpers/location_helper.dart';

import './txt_icon_btn.dart';
import '../map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectAddress;
  const LocationInput({Key? key, required this.onSelectAddress})
      : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String? _previewImageUrl;

  void _showPreview(double? lat, double? lng) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: lat,
      longtude: lng,
    );
    setState(
      () {
        _previewImageUrl = staticMapImageUrl;
      },
    );
  }

  Future _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      _showPreview(locData.latitude, locData.longitude);
      widget.onSelectAddress(
        locData.latitude,
        locData.longitude,
      );
    } catch (error) {
      return;
    }
  }

  Future _selectOnMap() async {
    try {
      final selectedLocation = await Navigator.of(context).push<LatLng>(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) => const MapScreen(
            isSelecting: true,
          ),
        ),
      );
      if (selectedLocation == null) {
        return;
      }
      _showPreview(selectedLocation.latitude, selectedLocation.longitude);
      widget.onSelectAddress(
        selectedLocation.latitude,
        selectedLocation.longitude,
      );
    } catch (errror) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: _selectOnMap,
          child: Container(
            height: 332.h,
            width: 302.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: _previewImageUrl == null
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      'txt10'.tr,
                      textAlign: TextAlign.center,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      _previewImageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextIconBtn(
                text: 'txtbtn4'.tr,
                onpress: _getCurrentUserLocation,
                icon: Icons.share_location),
            TextIconBtn(
              text: 'txtbtn5'.tr,
              onpress: _selectOnMap,
              icon: Icons.map,
            ),
          ],
        ),
      ],
    );
  }
}
