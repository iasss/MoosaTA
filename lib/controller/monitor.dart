import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moosa/models/monitor.dart';

import 'auth.dart';

class cardhomeapi {

  Auth auth = Auth();

  Future<List<cardhome>> getcard() async {
    final String? token = await auth.getToken();
    final int? id = await auth.getIdUser();

    String urlcard = 'https://moosa2023.000webhostapp.com/api/android/alatuser/$id';
    final response = await http.get(Uri.parse(urlcard), headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['alat']) {
      _temp.add(i);
    }

    return cardhome.CardhomefromSnapshot(_temp);
  }
  
}