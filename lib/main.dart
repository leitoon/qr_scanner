import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/maps_pages.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {'home': (_) => HomeScreen(), 'maps': (_) => MapsScreen()},
          theme: ThemeData(
              colorScheme: ColorScheme.light().copyWith(
                primary: Color.fromARGB(255, 6, 44, 75),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 6, 44, 75),
              ))),
    );
  }
}
