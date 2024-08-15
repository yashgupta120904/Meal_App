import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/screens/tabsscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const TabsScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 0, 0, 0),
      body: 
          Center(
          
            child: Container(
              height: 200,
              width: 200,
              child: const  CircleAvatar(
                
                
          
               
          
            
                 backgroundImage: AssetImage("assets/images/last gif.gif"))

          
              
              
              
                
               
              ),
            ),
       
        
      );
    
  }
}
