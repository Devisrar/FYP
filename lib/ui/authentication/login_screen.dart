import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_2/Aboutus/aboutapp.dart';
import 'package:fyp_2/firebaseservices/splashservices.dart';
import 'package:fyp_2/ui/authentication/login_withphonenumber.dart';
import 'package:fyp_2/ui/post_screens/postscreen.dart';
import 'package:fyp_2/ui/authentication/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_2/ulits/utilities.dart';
import 'package:lottie/lottie.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool Loading = false;
  final auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() {
    setState(() {
      Loading = true;
    });
    auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {        Loading = false;
      });
      utilities().toastmessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => postscreen()));
    }).onError((error, stackTrace) {
      setState(() {
        Loading = false;
      });
      debugPrint(error.toString());
      utilities().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
            backgroundColor: Color(0xff023047),
            body: Padding(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Lottie.network(
                          'https://assets6.lottiefiles.com/packages/lf20_XiFR0gJ2fr.json',
                          height: 250),
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter Your Email',
                                    prefixIcon: Icon(Icons.email),
                                    hintStyle: TextStyle(fontSize: 14),
                                    fillColor: Colors.black,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                              SizedBox(
                                height: 10,
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Loading = Loading;
                          if (formkey.currentState!.validate()) {
                            login();
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
                                      'Login',
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signup()));
                              },
                              child: Text(
                                'signup',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      loginwithphonenumber()));
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            'Login with phone',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color(0xff05668d),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xff05668d),)),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
