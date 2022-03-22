import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/personality/personality_cubit.dart';

import '/presentation/drawer/main_drawer.dart';

import './widgets/profile_body.dart';

class PersonalityScreen extends StatefulWidget {
  const PersonalityScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<PersonalityScreen> createState() => _PersonalityScreenState();
}

class _PersonalityScreenState extends State<PersonalityScreen> {
  File? _pickedImage;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _saveProfile() {
    if (_pickedImage == null ||
        _nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneNumberController.text.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    BlocProvider.of<PersonalityCubit>(context, listen: false).addProfile(
      _pickedImage!,
      _nameController.text,
      _emailController.text,
      _phoneNumberController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            'tit17'.tr,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: (Colors.white),
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: const MainDrawer(),
        body: FutureBuilder(
          future: BlocProvider.of<PersonalityCubit>(context, listen: false)
              .fetchAndSetRequests(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : BlocBuilder<PersonalityCubit, PersonalityState>(
                      builder: (context, state) {
                        if (state.profile.isEmpty) {
                          return ProfileBody(
                            nameController: _nameController,
                            emailController: _emailController,
                            phoneNumberController: _phoneNumberController,
                            selectImage: _selectImage,
                            saveProfile: _saveProfile,
                          );
                        } else {
                          _pickedImage = state.profile[0].image;
                          _nameController.text = state.profile[0].name;
                          _emailController.text = state.profile[0].email;
                          _phoneNumberController.text =
                              state.profile[0].phoneNumber;
                          return ProfileBody(
                            nameController: _nameController,
                            emailController: _emailController,
                            phoneNumberController: _phoneNumberController,
                            selectImage: _selectImage,
                            saveProfile: _saveProfile,
                          );
                        }
                      },
                    ),
        ));
  }
}
