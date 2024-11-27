import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Pages/continue_page.dart';
import 'package:shop_app/Pages/forget_password_page.dart';
import 'package:shop_app/Pages/login_page.dart';
import 'package:shop_app/Pages/setting_page.dart';
import 'package:shop_app/Pages/sign_up_page.dart';
import 'package:shop_app/Pages/splash_page.dart';
import 'package:shop_app/Providers/cart_provider.dart';
import 'package:shop_app/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          'login': (context) => const MyLogin(),
          'signup': (context) => const SignUpPage(),
          'homepage': (context) => const HomePage(),
          'forget_password': (context) => const ForgetPasswordPage(),
          'continue_page': (context) => const ContinuePage(),
          'setting_page': (context) => const SettingPage(),
        },
        title: 'Shopping app',
        home: const SplashPage(),
      ),
    );
  }
}
