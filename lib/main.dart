import 'package:camera/camera.dart';
import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/splash/splash_screen.dart';
import 'package:cropsecure/theme/light_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  GestureBinding.instance.resamplingEnabled = true; // Set this flag.
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await di.init();
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: light,
      home: SplashScreen(),

    );
  }

}