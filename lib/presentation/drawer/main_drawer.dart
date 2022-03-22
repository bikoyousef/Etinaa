import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '/logic/cubit/personality/personality_cubit.dart';

import 'widgets/language_switch.dart';
import 'widgets/drawer_items.dart';
import 'widgets/user_name.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 106.h,
              ),
              BlocBuilder<PersonalityCubit, PersonalityState>(
                builder: (context, state) {
                  if (state.profile.isEmpty) {
                    return UserName(
                      image: Image.asset(
                        'assets/images/drawer/profile.png',
                      ),
                      text: 'User Name',
                    );
                  } else {
                    context.read<PersonalityCubit>().fetchAndSetRequests();
                    final File profileImage = state.profile[0].image;
                    final String username = state.profile[0].name;
                    return UserName(
                      image: Image.file(profileImage),
                      text: username,
                    );
                  }
                },
              ),
              SizedBox(
                height: 35.h,
              ),
              const DrawerItems(),
              SizedBox(
                height: 35.h,
              ),
              const LanguageSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
