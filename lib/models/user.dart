
import 'dart:convert';

profile userFromJson(String str) => profile.fromJson(json.decode(str));

String userToJson(profile data) => json.encode(data.toJson());

class profile {
  final String nama_user;
  final String email;
  final String no_telp;

  profile({
    required this.nama_user,
    required this.email,
    required this.no_telp
  });

  factory profile.fromJson(Map<String, dynamic> json) => profile(
        nama_user: json["nama_user"],
        email: json["email"],
        no_telp: json["no_telp"],
      );

  Map<String, dynamic> toJson() => {
        "nama_user": nama_user,
        "email": email,
        "no_telp": no_telp,
      };
}

class UserUpdate {
  final String email;
  final String password;
  final String Nama;
  final String Telp;

  UserUpdate({required this.email, required this.password, required this.Nama, required this.Telp});

  Map<String, dynamic> toJson() {
    return {

      'email': email,
      'password': password,
      'nama_user': Nama,
      'no_telp': Telp,
    };
  }
}

class AlatUpdate {
  final String kode;
  final String pwalat;
  final String Namasapi;
  

  AlatUpdate({required this.kode, required this.pwalat, required this.Namasapi});

  Map<String, dynamic> toJson() {
    return {

      'kode': kode,
      'password': pwalat,
      'nama_sapi': Namasapi,
      
    };
  }
}