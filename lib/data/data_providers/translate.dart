import 'package:cleaning/data/repositories/arabic.dart';
import 'package:cleaning/data/repositories/english.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabic,
        'en': english,
      };

  static const locals = [Locale('ar', ''), Locale('en', '')];
}
