import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/auth_provider.dart';
import 'package:untitled4/provider/count_provider.dart';
import 'package:untitled4/provider/example_one.dart';
import 'package:untitled4/provider/favourite_provider.dart';
import 'package:untitled4/provider/theme_provider.dart';


import 'package:untitled4/screen/login.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(_)=>CountProvider()  ),
          ChangeNotifierProvider(create: (_)=>ExampleOneProvider()  ),
          ChangeNotifierProvider(create: (_)=> FavouriteItemProvider() ),
          ChangeNotifierProvider(create: (_)=> ThemeChangeProvider() ),
          ChangeNotifierProvider(create: (_)=> AuthProvider() ),
        ],
      child: Builder(
          builder: (BuildContext context){
            final themeChanger=Provider.of<ThemeChangeProvider>(context);
            return  MaterialApp(
              themeMode: themeChanger.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                appBarTheme: const AppBarTheme(
                  color: Colors.red,
                )
              ),
              darkTheme: ThemeData(

                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.teal,
                  ),
                iconTheme: const IconThemeData(
                  color: Colors.red
                )
              ),
              home: const LoginScreen(),
              );

      })


    );

  }
}
