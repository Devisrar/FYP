import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fyp_2/Rateus/rateus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2/Aboutus/aboutapp.dart';
import 'package:fyp_2/ulits/utilities.dart';
import '../authentication/login_screen.dart';
import 'dart:math';

class postscreen extends StatefulWidget {
  const postscreen({Key? key}) : super(key: key);

  @override
  State<postscreen> createState() => _postscreenState();
}

class _postscreenState extends State<postscreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff023047),
        drawer: Drawer(
          backgroundColor: Color(0xff023047),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Muhammad israr'),
                accountEmail: Text('israr.exs@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('I'),
                  backgroundColor: Color(0xff023047),
                ),
              ),
              ListTile(
                leading: InkWell(
                  child: Icon(
                    Icons.share_sharp,
                    color: Colors.brown,
                  ),
                ),
                title: Text(
                  'About us',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.payment,
                  color: Colors.brown,
                ),
                title: Text(
                  'Payment',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.car,
                  color: Colors.brown,
                  size: 30,
                ),
                title: Text(
                  'Drivers',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.brown,
                ),
                title: Text(
                  'Setting and Privacy',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_call,
                  color: Colors.brown,
                ),
                title: Text(
                  'Calls',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.person_3,
                  color: Colors.brown,
                  size: 30,
                ),
                title: Text(
                  'Doctors',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.brown,
                ),
                title: Text(
                  'Dark and light mode',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.brown,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff023047),
          toolbarHeight: 100,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          title: Text(
            'Zindagi Muhafiz ',
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Color(0xff023047),
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff023047),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Color(0xff023047),
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff023047),
                  ),
                  child: Icon(
                    Icons.notifications,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Color(0xff023047),
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Color(0xff023047),
                  ),
                  child: IconButton(
                    onPressed: () {
                      auth.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginscreen())).onError((error, stackTrace){
                                  utilities().toastmessage(error.toString());
                        });
                      });
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 26,
                )
              ],
            )
          ],
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1600091474842-83bb9c05a723?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lZGljYWwlMjBjYXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1619025873875-59dfdd2bbbd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fEFtYnVsYW5jZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1664299503603-237d266dc7cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8QW1idWxhbmNlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaWNhbCUyMGNhcmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1561715608-5659baeccfb4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fEVtZXJnZW5jeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(14),
              child: Text('More with Zindagi Muhafiz',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            // Container(
            //   height: 80.0,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1588543385566-413e13a51a24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YW1idWxhbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1604357209793-fca5dca89f97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bG9jYXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1519709042477-8de6eaf1fdc5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bG9jYXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1595246478312-5a49fbcf31b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFtYnVsYW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1595246478312-5a49fbcf31b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFtYnVsYW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Image(
            //         image: NetworkImage(
            //             'https://images.unsplash.com/photo-1595246478312-5a49fbcf31b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFtYnVsYW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
            //         fit: BoxFit.cover,
            //         height: 10.0,
            //         width: 90,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Color(0xff919151),
            //             ),
            //             height: 100,
            //             width: 100,
            //             child: Center(
            //                 child: Text(
            //               'Driver',
            //               style: TextStyle(color: Colors.black),
            //             )),
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Container(
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Color(0xff400036),
            //             ),
            //             height: 100,
            //             width: 150,
            //             child: Center(
            //                 child: Text(
            //               'Ambulance',
            //               style: TextStyle(color: Colors.white),
            //             )),
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Container(
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Color(0xff105057),
            //             ),
            //             height: 100,
            //             width: 100,
            //             child: Center(
            //                 child: Text(
            //               'Location',
            //               style: TextStyle(color: Colors.white),
            //             )),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 30,
            //     ),
            //     Row( mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Center(
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 shape: BoxShape.rectangle,
            //                 color: Color(0xffFF5A33),
            //                 borderRadius: BorderRadius.circular(20)),
            //             height: 70,
            //             width: 400,
            //             child: Center(
            //               child: Text(
            //                 'Confirm Booking',
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //           ),
            //         ),
            //
            //
            //       ],
            //     )
            //   ],
            // )
//edr sy code krna ha
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Services(),
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                color: Color(0xff023047),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 90,
                      width: 100,
                      child: Center(
                          child: Text(
                        'Bookme',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 90,
                      width: 100,
                      child: Center(
                          child: Text(
                        'Donate us',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 90,
                      width: 100,
                      child: Center(
                        child: Text('Rate us',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                color: Color(0xff22223b),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: FloatingActionButton.extended(
                label: Text('Swipe down',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)), // <-- Text
                backgroundColor: Color(0xff05668d),
                icon: Icon(
                  Icons.expand_circle_down,
                  color: Colors.white,
                  size: 26.0,
                ),
                onPressed: () {},
              ),
            ),
SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Discover More Medikits',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Card(
                color: Color(0xff023047),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 100,
                      child: Center(
                          child: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.add_card_sharp,color: Colors.black,),
                          )),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 100,
                      child: Center(
                            child: IconButton(
    onPressed: (){

    },
    icon: Icon(Icons.accessibility_rounded,color: Colors.black,),
    )),
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(0xffaec3b0),
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 100,
                      child: Center(
                        child: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.more_horiz,color: Colors.black,),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //edr tk
          ],
        ),
      ),
    );
  }
}

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Card(
          color: Color(0xff023047),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffaec3b0),
                    borderRadius: BorderRadius.circular(20)),
                height: 90,
                width: 100,
                child: Center(
                    child: Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 27,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffaec3b0),
                    borderRadius: BorderRadius.circular(20)),
                height: 90,
                width: 100,
                child: Center(
                    child: Text(
                  'Drivers',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 27,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffaec3b0),
                    borderRadius: BorderRadius.circular(20)),
                height: 90,
                width: 100,
                child: Center(
                    child: Text(
                  'Payments',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
