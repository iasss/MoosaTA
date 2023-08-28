import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth.dart';




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Auth auth = Auth();
  
  Auth controller = Get.put(Auth());

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Container(
          padding: EdgeInsets.fromLTRB(54, 0, 54, 0),
          color: Color(0xFF39715C),
          
          child: ListView(
            
            children: <Widget>[
              SizedBox(height: 50,),
              Image.asset("assets/logologin.png"),
              Center(
                child: 
                  Text("LOG IN",
                    style: TextStyle(fontFamily: "Poppins-SemiBold", fontSize: 27, 
                    fontWeight: FontWeight.w700 ,color: Color.fromARGB(255, 253, 255, 254))
                    ),
                  ),
              SizedBox(height: 15,),
              Text("Username", style: TextStyle(
              fontFamily: "Poppins-Medium",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              ),),
              TextField(controller: controller.usernameController ,decoration: InputDecoration(labelText: 'Username')),
              SizedBox(height: 15,),
              Text("Password", style: TextStyle(
              fontFamily: "Poppins-Medium",
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              ),),
              TextField(controller: controller.passwordController, decoration: InputDecoration(labelText: 'Password')),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    controller.login();
                  },
                  child: Text("LOG IN", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins-SemiBold",
                    
                    color: Color.fromARGB(255, 0, 0, 0),
                    ),),
                    style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
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
  