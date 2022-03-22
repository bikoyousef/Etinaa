import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({
    Key? key,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File? _storedImage;

  Future<void> _takePicture() async {

    final ImagePicker _picker = ImagePicker();

    final XFile? imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      // (source: ImageSource.camera)
      maxWidth: 600,
    );

    if (imageFile == null) {
      return;
    }
    final img = File(imageFile.path);

    setState(() {
      _storedImage = img;
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(img.path);
    final savedImage = await img.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (108).h,
      width: (108).w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: _storedImage != null
          ? GestureDetector(
              onTap: _takePicture,
              child: Image.file(
                _storedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                isAntiAlias: true,
              ),
            )
          : GestureDetector(
              onTap: _takePicture,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 33.h,
                  ),
                  Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).primaryColor,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'txtbtn7'.tr,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
      alignment: Alignment.center,
    );
  }
}
