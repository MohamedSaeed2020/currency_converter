import 'package:calculator_converter/Config/app.dart';
import 'package:calculator_converter/Cores/Helpers/app_helpers.dart';
import 'package:calculator_converter/Cores/network/dio_helper.dart';
import 'package:calculator_converter/Cores/services/hive_service.dart';
import 'package:calculator_converter/Cores/services/services_locator.dart';
import 'package:flutter/material.dart';


class AppConfigs {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();
    ServicesLocator.init();
    await locator<HiveService>().initHiveService();
    locator<DioHelper>().init();
    AppHelpers.checkTimeToDeleteCachedData();
    AppHelpers.makeAppInPortraitModeOnly();
    AppHelpers.makeStatusBarColorTransparent();
    runApp(const MyApp());
  }
}
