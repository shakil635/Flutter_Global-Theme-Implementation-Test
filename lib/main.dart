import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
Practice Question 1: Implementing and Testing a Global Theme
Task Description:
Create a Flutter application that implements a global theme using ThemeData. 
Your application should have a consistent visual style across 
different screens and widgets (like Text, Button, AppBar, etc.) 
by utilizing the defined theme.
 */
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home:const GlobalTheme() ,
    );
  }

     ThemeData globalTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: Colors.amber,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.oswald(
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
        bodyLarge:
            GoogleFonts.amarante(fontSize: 42, fontStyle: FontStyle.italic),
 
        bodyMedium: GoogleFonts.merriweather(),
   
        displaySmall: GoogleFonts.pacifico(),
      ),
    );
  }

}
class GlobalTheme extends StatelessWidget {

  const GlobalTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary ,
      ),
      body:SafeArea(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

    TextButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
    ),
    onPressed: (){},
     child: Text('Some text here', style: Theme.of(context).textTheme.bodyLarge))

          ],
        )

         ) ,
      );
  }
}



