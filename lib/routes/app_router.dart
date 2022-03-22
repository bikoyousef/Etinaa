import 'package:flutter/material.dart';

import '/presentation/screens/package_details2/package_details_screen2.dart';
import '/presentation/screens/another_request/another_request_screen.dart';
import '/presentation/screens/package_details/package_details_screen.dart';
import '/presentation/screens/saved_address/saved_addresses_screen.dart';
import 'package:cleaning/presentation/screens/login/login_screen.dart';
import '/presentation/screens/add_address/add_address_screen.dart';
import '/presentation/screens/profile/personality_screen.dart';
import '/presentation/screens/services/services_screen.dart';
import '/presentation/screens/wellcome/wellcome_screen.dart';
import '/presentation/screens/register/register_screen.dart';
import '/presentation/screens/package/package_screen2.dart';
import '/presentation/screens/call_us/call_us_screen.dart';
import '/presentation/screens/add_address/map_screen.dart';
import '/presentation/screens/package/package_screen.dart';
import '/presentation/screens/home/home_screen.dart';
import '/presentation/tabs/requests_tabs_top.dart';

Map<String, WidgetBuilder> router = {
  WellcomeScreen.routeName: (context) => const WellcomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ServicesScreen.routeName: (context) =>  ServicesScreen(),
  SavedAddressesScreen.routeName: (context) => const SavedAddressesScreen(),
  AddAddressScreen.routeName: (context) => const AddAddressScreen(),
  MapScreen.routeName: (context) => const MapScreen(),
  PackageScreen.routeName: (context) =>  PackageScreen(),
  PackageScreen2.routeName: (context) => const PackageScreen2(),
  PackageDetailsScreen.routeName:(context) => const PackageDetailsScreen(),
  PackageDetailsScreen2.routeName:(context) => const PackageDetailsScreen2(),
  RequestsTabsTop.routeName:(context) => const RequestsTabsTop(),
  CallUsScreen.routeName:(context) => const CallUsScreen(),
  AnotherRequestScreen.routeName:(context) => const AnotherRequestScreen(),
  PersonalityScreen.routeName:(context) => const PersonalityScreen(),
};
