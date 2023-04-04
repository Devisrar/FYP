import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2/ui/authentication/verificationcode.dart';
import 'package:fyp_2/ulits/utilities.dart';
class loginwithphonenumber extends StatefulWidget {
  const loginwithphonenumber({Key? key}) : super(key: key);

  @override
  State<loginwithphonenumber> createState() => _loginwithphonenumberState();
}

class _loginwithphonenumberState extends State<loginwithphonenumber> {
  final phonenummbercontroller=TextEditingController();
  bool Loading=false;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff023047),
      appBar: AppBar(
automaticallyImplyLeading: false,
        title: Center(child: Text('Phone verification')),

        backgroundColor: Color(0xff05668d),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
          Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/128/9351/9351731.png')),
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              keyboardType: TextInputType.number,
            controller: phonenummbercontroller,
            decoration: InputDecoration(

              border: OutlineInputBorder(),

              hintText: '+ 92 33 05 54 95 0 87',
              hintStyle: TextStyle(fontSize: 14),
              labelStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white.withOpacity(0.3),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(50),


              ),

            ),

            ),

          ),
            SizedBox(height: 70,),
            InkWell(
              onTap: (){
                auth.verifyPhoneNumber(
                  phoneNumber: phonenummbercontroller.text,
                    verificationCompleted: (_){

                    },
                    verificationFailed:(e){
                    utilities().toastmessage(e.toString());
                    },
                    codeSent: (String verificationId, int? token){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verificationcode(verificationId:verificationId)));
                    },
                    codeAutoRetrievalTimeout: (e){
                      utilities().toastmessage(e.toString());
                    },);
              },
              child: Container(
                child: Center(
                    child:
                    Text(
                      'login',
                      style: TextStyle(color: Colors.white,fontSize: 15),
                    )),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                color: Color(0xff05668d),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Color(0xff05668d),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
