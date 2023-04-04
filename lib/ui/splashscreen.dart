import 'package:flutter/material.dart';
import 'package:fyp_2/firebaseservices/splashservices.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  splashservices splashscreen=splashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.islogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHF-mON_ze8cOYhkW_o3CUCRiIdW7whExRQg&usqp=CAU")),
          SizedBox(
            height: 170,
          ),
          Center(

              child: Text(
            'Zindagi Muhafiz',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 5,),
          Text('ایمبولینس بلاو جان بچاؤ', style: TextStyle(
            //زندگی محافظ
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)



        ],
      ),
    );
  }
}
