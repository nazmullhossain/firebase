import 'package:firebase_auth/screen/text_demo.dart';
import 'package:flutter/material.dart';

import '../varriable/custom_textfield.dart';


class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController emailcontrolar = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  String? email, password;
  String?emailError, passError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                transform: GradientRotation(90),
                colors: [
                  Color(0xFF666699),
                  Color(0xFF9E84A3),
                  Color(0xFF000000),
                ],
              )
            ),
          ),
          Positioned(
              left: 85,
              right: 85,
              bottom: 130,
              child: InkWell(
            onTap: (){
              email = emailcontrolar.text;
              password = passwordcontroller.text;
              if(_formkey.currentState!.validate()){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextDemo(

                )));
              }
            },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),

                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFDECACF),
                        Color(0xFF86A5C9),
                      ],
                    )
                  ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                ),
          )),
          Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: Container(
                alignment: Alignment.center,
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                   end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                    colors: [
                      Color(0xFFE1CCD5),
                      Color(0xFFACBED9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 4),
                        spreadRadius: 2)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CoustomTextFormFeild(
                          controller: emailcontrolar,
                          hintText: 'email',
                          prefixIcon: Icons.email,
                          validator: (value){
                            if(value.toString().isEmpty){
                              return ('Please enter your email');
                            }
                            if(!value.toString().contains('@')){
                              return ('Please enter a valid email');
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CoustomTextFormFeild(
                          controller: passwordcontroller,
                          validator: (value){
                            if(value.toString().isEmpty){
                              return ('Please enter your password');
                            }
                            if(value.toString().length>10){
                              return ('Your password is too long');
                            }
                            if(value.toString().length<4){
                              return ('Your password is too short');
                            }
                          },
                          hintText: 'password',
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: null,
                                  fillColor: MaterialStateProperty.all(Color(0xFF0F3551)),
                                ),
                                Text('Remember me',
                                  style: TextStyle(
                                      color: Color(0xFF445C7B)
                                  ),
                                ),
                              ],
                            ),
                            Text('Forgot Password?',
                              style: TextStyle(
                                  color: Color(0xFF445C7B)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),

                  ),
                ),
              )
          ),
          Positioned(
            top: 25,
            left: 50,
            right: 50,
            child: CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.person_outline,
                size: 30,
              ),
              backgroundColor: Color(0xFF123357),
            ),
          ),
        ],
      ),
    );
  }
}
