import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/view/Home/home.dart';

import '../controller/profile.dart';





class tambahalat extends StatefulWidget {
  const tambahalat({super.key});

  @override
  State<tambahalat> createState() => _tambahalatState();
}

class _tambahalatState extends State<tambahalat> {
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
        title: Text('Tambah Alat'),
        leading: 
        IconButton( onPressed: () {
          Get.off(HomePage());
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
              Center(
                child: Stack(
                  children: [
                    Container(  
                      width: 200,
                      height: 155,
                      decoration: BoxDecoration(
                        //border: Border.all(width: 2, color: Colors.white,),
                        boxShadow: [
                          BoxShadow(
                            //spreadRadius: 2,
                            //blurRadius: 10,
                            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/kalung.png',),
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
                    Text("Alat Monitoring Kesehatan Sapi", 
                    style: TextStyle(fontFamily: "Poppins-Medium", 
                    fontSize: 15, color: Color.fromARGB(255, 0, 0, 0), 
                    fontWeight: FontWeight.w700)
                    ),
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10,),
                width: 500,
                height: 335,
                
                decoration: BoxDecoration(
                color: Color(0xFF39715C),
                borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Text("No. Seri Alat", style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    ),),
                    SizedBox(height: 10,),
                    TextField(textAlign: TextAlign.center,
                    controller: controller.noalat,
                    decoration: InputDecoration(

                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "No. Seri Alat",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintStyle: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    ),
                    ), ),
                    SizedBox(height: 10,),
                    Text("Password", style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    ),),
                    SizedBox(height: 10,),
                    TextField(textAlign: TextAlign.center,
                    controller: controller.pwalat,
                    decoration: InputDecoration(

                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Password",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintStyle: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    ),
                    ), ),
                    SizedBox(height: 10,),
                    Text("Nama Sapi", style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    ),),
                    SizedBox(height: 10,),
                    TextField(textAlign: TextAlign.center,
                    controller: controller.namasapi,
                    decoration: InputDecoration(

                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Nama Sapi",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    hintStyle: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    ),
                    ), ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    controller.updatealat();
                  }, 
                  child: Text("SIMPAN", style: TextStyle(
                    color: Colors.white,
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
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

}

