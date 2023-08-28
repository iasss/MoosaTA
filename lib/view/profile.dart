import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/controller/profile.dart';
import 'package:moosa/view/Home/home.dart';
import 'package:moosa/view/profileedit.dart';

import '../controller/auth.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String? userId = Get.parameters['id'];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  Auth auth = Auth();
  profilecontroller controller = profilecontroller();
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), 
          ),
        ),
        backgroundColor: Color(0xFF39715C),
        title: Text('Profile Page'),
        leading:
        IconButton( onPressed: () {
          Get.off(HomePage());
        },
          icon: Icon(CupertinoIcons.back),
          color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: () {
              Get.off(EditProfilePage());
            }, 
            icon: Icon(Icons.create),
            color: Colors.white,)
          ],
      ),
      body: FutureBuilder( future: controller.Profile(),builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Colors.white,);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              
              return Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(  
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white,),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icon_profile.jpg',),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Positioned(child: 
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hi, ", 
                          style: TextStyle(fontFamily: "Poppins-Medium", 
                          fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), 
                          fontWeight: FontWeight.w400)
                          ),
                          Text("${controller.namauser.value}.", 
                          style: TextStyle(fontFamily: "Poppins-Medium", 
                          fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), 
                          fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                    ),
                    ),
              ),
              SizedBox(
                height: 60,
              ),
              buildTextField("Email", "${controller.email.value}"),
              buildTextField("No. Telp", '${controller.no_telp.value}'),
              SizedBox( height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    auth.logout();
                  }, 
                  child: Text("LOG OUT", style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );}
  })
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
    padding: EdgeInsets.only(bottom: 30,),
    child: TextField(
      
      decoration: InputDecoration(
        
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),

            ),
            ), 
    ),
    );
  }
}





