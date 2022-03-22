import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/address/address_cubit.dart';
import '/data/models/address_location.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';
import '/presentation/widgets/text_field.dart';

import './widgets/location_input.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);
  static const routeName = '/add_address';

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _titlecontroller = TextEditingController();

  AddressLocation? _pickedLocation;

  void _selectAddress(double lat, double lng) {
    _pickedLocation = AddressLocation(
      latitude: lat,
      longtiude: lng,
    );
  }

  void _saveAddress() {
    if (_titlecontroller.text.isEmpty || _pickedLocation == null) {
      return;
    }
    FocusScope.of(context).unfocus();
    BlocProvider.of<AddressCubit>(context, listen: false)
        .addAddress(_titlecontroller.text, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit10'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            StepProgress(
              circleColor1: Theme.of(context).colorScheme.secondary,
              lineColor1: Colors.grey,
              circleColor2: Colors.grey,
              lineColor2: Colors.grey,
              circleColor3: Colors.grey,
            ),
            SizedBox(
              height: 23.sp,
            ),
            LocationInput(
              onSelectAddress: _selectAddress,
            ),
            SizedBox(
              height: 23.sp,
            ),
            TextFieldIn(
              height: 46.h,
              hintText: 'hinttxt1'.tr,
              controller: _titlecontroller,
              inputAction: TextInputAction.done,
              inputType: TextInputType.text,
              color: Colors.black,
            ),
            SizedBox(
              height: 28.h,
            ),
            SizedBox(
              height: 47.h,
              width: 222.w,
              child: ElevateYellowBtn(
                onpress: _saveAddress,
                text: 'btn4'.tr,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ]),
        ),
      ),
    );
  }
}
