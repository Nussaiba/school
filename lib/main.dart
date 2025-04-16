import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/bindings/initialbindinds.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/services/services.dart';
import 'package:school/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale('ar', ''),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColor.kpraimaryColor,
          primaryColor: AppColor.kpraimaryColor,
          appBarTheme: AppBarTheme(
            color: AppColor.kpraimaryColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: AppColor.kTextWhiteColor,
              fontSize: 22.0,
            ),
            iconTheme: IconThemeData(
              color: AppColor.kTextWhiteColor,
            ),
          ),
          textTheme: Theme.of(context).textTheme.apply().copyWith(
                bodyLarge: TextStyle(
                  fontFamily: 'Tajawal',
                  color: AppColor.kTextWhiteColor,
                  fontSize: 35.0,
                  letterSpacing: 2.0,
                ),
                bodyMedium: TextStyle(
                  fontFamily: 'Tajawal',
                  color: AppColor.kTextWhiteColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
                bodySmall: TextStyle(
                  fontFamily: 'Tajawal',
                  color: AppColor.kTextWhiteColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
                fontFamily: 'Tajawal',
                color: AppColor.kTextLightColor,
                fontSize: 18.0,
                height: 0.5),
            hintStyle: TextStyle(
                fontFamily: 'Tajawal',
                color: AppColor.kTextBlackColor,
                fontSize: 16.0,
                height: 0.5),
            errorStyle:
                TextStyle(fontFamily: 'Tajawal', fontSize: 14.0, height: 1.2),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kTextLightColor,
              width: 0.7,
            )),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kTextLightColor,
            )),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kTextLightColor,
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kpraimaryColor,
            )),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kErrorColor,
              width: 1.2,
            )),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: AppColor.kErrorColor,
              width: 1.2,
            )),
          )),
      builder: (context, child) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      initialRoute: '/splash',
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
