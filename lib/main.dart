import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:sizer/sizer.dart';

import 'package:test_to_do/home_screen/home/home.dart';
import 'package:test_to_do/router/app_pages.dart';
import 'package:test_to_do/router/app_roters.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //imp line need to be added first

  FlutterError.onError = (FlutterErrorDetails details) {
    //this line prints the default flutter gesture caught exception in console
    //FlutterError.dumpErrorToConsole(details);
    print("Error From INSIDE FRAME_WORK");
    print("----------------------");
    print("Error :  ${details.exception}");
    print("StackTrace :  ${details.stack}");
  };
  await Hive.initFlutter();
  await Hive.openBox('task');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRouters.home,
          getPages: AppPages.pages,
        );
      },
    );

  }
}


