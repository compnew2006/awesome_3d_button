import 'package:flutter/material.dart';

import 'package:awesome_3d_button/awesome_3d_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Awesome3DButton(
              buttonChild: Text(
                "3D Button",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              buttonHeight: 100,
              buttonWidth: 300,
              thickness: 20,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
