import 'package:flutter/material.dart';

import 'package:mvp_app/providers/image_provider.dart';
import 'package:mvp_app/providers/print_vendor_provider.dart';
import 'package:mvp_app/screens/home_screen.dart';
import 'package:mvp_app/screens/order_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (BuildContext ctx) => ImageGenerateProvider(),
                ),
                ChangeNotifierProvider(
                    create: (BuildContext ctx) => PrintVendorProvider())
              ],
              child: MyHomePage(
                title: 'MVP',
              ),
            ),
        '/order': (context) => OrderScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
