import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/another_request/another_request_cubit.dart';
import '/logic/cubit/personality/personality_cubit.dart';
import '/logic/cubit/authentication/auth_cubit.dart';
import '/logic/cubit/requests/requests_cubit.dart';
import '/logic/cubit/address/address_cubit.dart';
import '/logic/cubit/call_us/call_cubit.dart';
import 'data/data_providers/translate.dart';

import '/routes/app_router.dart';

import '/presentation/screens/wellcome/wellcome_screen.dart';
import '/presentation/screens/splash/splash_screen.dart';
import '/presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xff1298ad);
    const Color secondary = Color(0xf0FFA62B);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => AddressCubit(),
          ),
          BlocProvider(
            create: (context) => RequestsCubit(),
          ),
          BlocProvider(
            create: (context) => CallCubit(),
          ),
          BlocProvider(
            create: (context) => AnotherRequestCubit(),
          ),
          BlocProvider(
            create: (context) => PersonalityCubit(),
          ),
        ],
        child: GetMaterialApp(
          translations: Translate(),
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: 'tit1'.tr,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              titleTextStyle: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            primaryColor: primary,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan)
                .copyWith(secondary: secondary),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  headline2: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  bodyText1: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyText2: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 16.sp,
                  ),
                  headline3: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 14.sp,
                  ),
                  headline5: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 18.sp,
                  ),
                  headline6: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle1: TextStyle(
                    fontFamily: 'Hanimation',
                    fontSize: 14.sp,
                  ),
                ),
          ),
          home: 
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state.isAuth
                  ? const HomeScreen()
                  : FutureBuilder(
                      future: context.read<AuthCubit>().tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? const SplashScreen()
                              : const WellcomeScreen(),
                    );
            },
          ),
          routes: router,
          onUnknownRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (ctx) => const WellcomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
