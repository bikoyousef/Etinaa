import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/data/models/http_exception.dart';
import '/logic/cubit/authentication/auth_cubit.dart';

import '/presentation/screens/login/login_screen.dart';

import '/presentation/widgets/text_btn.dart';
import '/presentation/widgets/wellcom_text.dart';
import '/presentation/widgets/gradient_btn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthCubit _authCubit = AuthCubit();

  final Map<String, String> _userData = {
    'email': '',
    'password': '',
  };

  bool obSecure1 = true;
  bool obSecure2 = true;
  var _isloading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('alerttxt1'.tr),
        content: Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('txtbtn3'.tr))
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(
      () {
        _isloading = true;
      },
    );
    try {
      FocusScope.of(context).unfocus();
      await _authCubit.signUp(
        _userData['email'],
        _userData['password'],
      );
      await Navigator.of(context).pushNamed(LoginScreen.routeName);
    } on HttpException catch (error) {
      var errorMessage = 'error1'.tr;
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'error2'.tr;
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'error3'.tr;
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'error4'.tr;
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'error5'.tr;
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'error6'.tr;
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      final errorMessage = 'error7'.tr;
      _showErrorDialog(errorMessage);
    }
    setState(
      () {
        _isloading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('tit5'.tr),
        centerTitle: true,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all((35).sp),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                const WellcomText(),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'txt4'.tr,
                    icon: const Icon(Icons.mail),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.justify,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'valid3'.tr;
                    }
                    if (!value.contains('@') && !value.endsWith('.com')) {
                      return 'valid4'.tr;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userData['email'] = value!;
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                StatefulBuilder(builder: (context, state) {
                  return TextFormField(
                    obscureText: obSecure1,
                    decoration: InputDecoration(
                      labelText: 'txt2'.tr,
                      icon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          state(
                            () {
                              obSecure1 = !obSecure1;
                            },
                          );
                        },
                        child: obSecure1
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(
                                Icons.visibility,
                              ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.justify,
                    controller: _pass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'valid5'.tr;
                      }
                      if (value.length <= 8) {
                        return 'valid6'.tr;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userData['password'] = value!;
                    },
                  );
                }),
                SizedBox(
                  height: 25.h,
                ),
                StatefulBuilder(
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: obSecure2,
                      decoration: InputDecoration(
                        labelText: 'txt5'.tr,
                        icon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            state(
                              () {
                                obSecure2 = !obSecure2;
                              },
                            );
                          },
                          child: obSecure2
                              ? const Icon(
                                  Icons.visibility_off,
                                )
                              : const Icon(
                                  Icons.visibility,
                                ),
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.justify,
                      validator: (value) {
                        if (value != _pass.text) {
                          return 'valid7'.tr;
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                if (_isloading)
                  const CircularProgressIndicator()
                else
                  SizedBox(
                    height: 47.h,
                    width: 222.w,
                    child: GradientBtn(
                      text: 'btn2'.tr,
                      onpress: _submit,
                    ),
                  ),
                SizedBox(
                  height: 17.sp,
                ),
                TextBtn(
                  text: 'bod8'.tr,
                  onpress: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  txtbtn: 'txtbtn2'.tr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
