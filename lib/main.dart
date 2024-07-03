import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/constant/constant.dart';
import 'package:task/widget/login_button.dart';
import 'package:task/widget/redirect_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryTextTheme:
              GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
          primarySwatch: createMaterialColor(themeColor1),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
          useMaterial3: true,
        ),
        home: const LoginScreen());
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/connection.png",
                      scale: 3,
                    ),
                    Text(
                      "Let`s meeting new\n people around you ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.07),
                    ),
                    Column(
                      children: [
                        LoginButton(
                            onTap: () {},
                            buttonColor: themeColor1,
                            image: "assets/phone.png",
                            title: "Login With Phone",
                            width: width,
                            textColor: Colors.white),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        LoginButton(
                            onTap: () {},
                            buttonColor: themeColor2,
                            image: "assets/search.png",
                            title: "Login With Google",
                            width: width,
                            textColor: themeColor1),
                      ],
                    ),
                  ],
                ),
              ),
              RedirectButton(
                  text: "Don't have an account?",
                  onTap: (){},
                  label: "Sign Up"),
              const SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
