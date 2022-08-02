import 'package:flutter/material.dart';
import 'package:flutter_application_one/core/store.dart';
import 'package:flutter_application_one/pages/home_detail_page.dart';
import 'package:flutter_application_one/pages/home_page.dart';
import 'package:flutter_application_one/pages/login_page.dart';
import 'package:flutter_application_one/pages/register_page.dart';
import 'package:flutter_application_one/utils/routes.dart';
import 'package:flutter_application_one/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/cart_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      //initialRoute: "/home",
      debugShowCheckedModeBanner: false,

      routes: {
        MyRoutes.defaultRoute: (context) =>
            HomePage(), //set for dev default login
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.registerRoute: (context) => RegisterPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
