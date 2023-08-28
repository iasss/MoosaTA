import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moosa/controller/auth.dart';
import 'package:moosa/view/Home/home.dart';
import 'package:moosa/view/profile.dart';

import '../models/user.dart';


class profilecontroller extends GetxController{

  final  usernameprofile = TextEditingController();
  final  passwordprofile = TextEditingController();
  final  emailprofile = TextEditingController();
  final  noprofile = TextEditingController();
  final  noalat = TextEditingController();
  final  pwalat = TextEditingController();
  final  namasapi = TextEditingController();

  var namauser = "".obs;
  var email = "".obs;
  var no_telp ="".obs;
  Auth auth = Auth();

  Future Profile() async {
    final String? token = await auth.getToken();
    final int? id = await auth.getIdUser();
    String url = 'https://moosa2023.000webhostapp.com/api/android/user/$id';
    final response = await http.get(Uri.parse(url),
    headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },);
    
    var userData = jsonDecode(response.body);
    profile Profile = profile.fromJson(userData);
    namauser.value = Profile.nama_user;
    email.value = Profile.email;
    no_telp.value = Profile.no_telp;
  }

  Future updateprofile() async{
    
    final UserUpdate update = UserUpdate(
      email: emailprofile.value.text,
      password: passwordprofile.value.text,
      Nama: usernameprofile.value.text,
      Telp: noprofile.value.text
    );
    final String? token = await auth.getToken();
    final int? id = await auth.getIdUser();
    try {
      final response = await http.post(Uri.parse('https://moosa2023.000webhostapp.com/api/android/user/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'
      },
      body: jsonEncode(update),
          );
    var responupdate = jsonDecode(response.body);
    if (response.statusCode == 200){
      usernameprofile.clear();
      noprofile.clear();
      passwordprofile.clear();
      emailprofile.clear();
      Get.off(ProfilePage());
    }else {
      Get.snackbar('update', responupdate['error']);
    }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
  Future<void> updatealat() async{
    final String? token = await auth.getToken();
    final int? id = await auth.getIdUser();
    final AlatUpdate alatupdate = AlatUpdate(
      kode: noalat.value.text,
      pwalat: pwalat.value.text,
      Namasapi: namasapi.value.text,
      
    );
    try {
      final response = await http.post(Uri.parse('https://moosa2023.000webhostapp.com/api/android/alat/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'
      },
      body: jsonEncode(alatupdate),);
    var responupdate = jsonDecode(response.body);
    if (response.statusCode == 200){
      noalat.clear();
      pwalat.clear();
      namasapi.clear();
      Get.off(HomePage());
    }else {
      Get.snackbar('update', responupdate['message']);
    }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    }
  }
}


