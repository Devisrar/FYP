import 'package:flutter/material.dart';
import 'package:fyp_2/ui/authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_2/ui/post_screens/postscreen.dart';
import 'package:fyp_2/ulits/utilities.dart';
import 'package:lottie/lottie.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool Loading = false;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff023047),
          body: Padding(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Lottie.network('https://assets6.lottiefiles.com/packages/lf20_XiFR0gJ2fr.json',height: 250),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  hintText: 'Enter Your Name',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.person),
                                  hintStyle: TextStyle(fontSize: 14),
                                  fillColor: Colors.black,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your Name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText: 'Enter Your Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.email),
                                  hintStyle: TextStyle(fontSize: 14),
                                  fillColor: Colors.black,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your Email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter Password',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(fontSize: 14),
                                  prefixIcon: Icon(Icons.lock),
                                  fillColor: Colors.black,
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        )),

                    InkWell(
                      onTap: () {
                        Loading = Loading;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));


                        if (formkey.currentState!.validate()) {
                          setState(() {
                            Loading = true;
                          });
                          auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString())
                              .then((value) {
                            setState(() {
                              Loading = false;
                            });
                          }).onError((error, stackTrace) {
                            utilities().toastmessage(error.toString());
                            setState(() {
                              Loading = false;
                            });
                          });
                        }
                      },

                      child: Container(
                        child: Center(
                            child: Loading
                                ? CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Signup',
                                    style: TextStyle(color: Colors.white),
                                  )),
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xff05668d),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: TextStyle(color: Colors.white),),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginscreen()));
                            },
                            child: Text(
                              'login',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  ],
                ),
              ))),
    );
    ;
  }
}
