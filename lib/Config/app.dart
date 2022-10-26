import 'package:calculator_converter/Cores/services/navigation/routes.dart';
import 'package:calculator_converter/Cores/services/navigation/service.dart';
import 'package:calculator_converter/Cores/services/services_locator.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/converter_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/converter/currency_selection_cubit.dart';
import 'package:calculator_converter/Features/currency_converter/presentation/controllers/home/home_cubit.dart';
import 'package:calculator_converter/Utils/app_strings.dart';
import 'package:calculator_converter/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => locator<HomeCubit>(),
          ),
          BlocProvider(
            create: (context) =>
            locator<ConverterCubit>()..onInit(),
          ),
          BlocProvider(
            create: (context) => locator<CurrencySelectionCubit>(),
          ),
        ],
        child: GetMaterialApp(
          title: AppStrings.appName,
          navigatorKey: NavigationService.navigationKey,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },
          theme: ThemeData(
            fontFamily: fontFamily,
          ),
          initialRoute: NavigationRoutes.home,
          onGenerateRoute: generateRoute,
        ),
      );
    });
  }
}
