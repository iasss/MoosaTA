import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moosa/view/Home/home.dart';
import 'package:moosa/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Auth extends GetxController {

  
  final  usernameController = TextEditingController();
  final  passwordController = TextEditingController();
  static const String urlLogin = 'https://moosa2023.000webhostapp.com/api/android/login';

  

  void login() async{
    
    try {
      final response = await http.post(Uri.parse(urlLogin),
      body: {
      'nama_user' : usernameController.value.text,
      'password' : passwordController.value.text
    });

    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      
      final token = responseData['token'];
      final IdUser = responseData['id'];
      await saveToken(token);
      await saveIdUser(IdUser);
      Get.to(HomePage());
            
    }
    else {
      Get.snackbar('login', responseData['error']);
    }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }


  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('tokenKey');
    Get.offAll(Login());
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('tokenKey', token);
  }

  

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('tokenKey');
  }

  Future<int?> saveIdUser(int IdUser) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt('UserId', IdUser);
    return null;
  }

  Future<int?> getIdUser() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt('UserId');
  }

  

}

