import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
   TextDemo({Key? key, this.email, this.password}) : super(key: key);

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}
