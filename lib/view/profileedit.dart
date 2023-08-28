import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/controller/profile.dart';
import 'package:moosa/view/profile.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
   
   final profilecontroller profile = profilecontroller();
   profilecontroller controller = Get.put(profilecontroller());    

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
        title: Text('Edit Profile Page'),
        leading: IconButton( onPressed: () {
          Get.back();
        },
          icon: Icon(CupertinoIcons.back),
          color: Colors.white,
          ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(controller: controller.usernameprofile ,decoration: InputDecoration(labelText: 'Nama')),
              SizedBox( height: 30,),
              TextField(controller: controller.emailprofile ,decoration: InputDecoration(labelText: 'Email')),
              SizedBox( height: 30,),
              TextField(controller: controller.passwordprofile ,decoration: InputDecoration(labelText: 'Password')),
              SizedBox( height: 30,),
              TextField(controller: controller.noprofile ,decoration: InputDecoration(labelText: 'No. Telepon')),
              SizedBox( height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: () {
                    Get.off(Profile());
                  }, child: Text("CANCEL", style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  ),),
                  ElevatedButton(onPressed: () {
                    controller.updateprofile();
                  }, 
                  child: Text("SAVE", style: TextStyle(
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
      ),
    );
  }

  // Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField, controlleR) {
  //   return Padding(
  //   padding: EdgeInsets.only(bottom: 30,),
  //   child: TextField(
  //     controller: controlleR,
  //     obscureText: isPasswordTextField ? isObscurePassword : false,
  //     decoration: InputDecoration(
  //       suffixIcon: isPasswordTextField ?
  //         IconButton(
  //           icon: Icon(Icons.remove_red_eye, color: Colors.grey),
  //           onPressed: () {
  //             setState(() {
  //               isObscurePassword = !isObscurePassword;
  //             });
  //           }
  //           ): null,
  //           contentPadding: EdgeInsets.only(bottom: 5),
  //           labelText: labelText,
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           hintText: placeholder,
  //           hintStyle: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.grey,

  //           ),
  //           ), 
  //   ),
  //   );
  // }
}

