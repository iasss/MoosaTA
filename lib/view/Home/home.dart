import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/controller/auth.dart';
import 'package:moosa/controller/monitor.dart';
import 'package:moosa/models/monitor.dart';
import 'package:moosa/view/Home/widget/cardhome.dart';
import 'package:moosa/view/camera.dart';
import 'package:moosa/view/profile.dart';
import 'package:moosa/view/tambahalat.dart';

import 'widget/cardalat.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<cardhome> _card;
  bool _isLoading = true;
  Auth auth = Auth();
  cardhomeapi api = cardhomeapi();

  @override
  void initState() {
    super.initState();
    getcardhome();
  }

  Future<void> getcardhome() async {
    _card = await api.getcard();
    
    setState(() {
      _isLoading = false;
      // print(_card);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
        child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: Positioned(
          child: Container(
            margin: EdgeInsets.fromLTRB(21, 40, 180, 0,),
            child: 
               Text("Welcome to Moosa",
               style: TextStyle(fontFamily: "Poppins-SemiBold", 
               fontSize: 27, color: Color(0xFF194C39), 
               fontWeight: FontWeight.w800)
                ),             
               ),
          ),
           
         actions: [
            GestureDetector(
              onTap: () => Get.to(Profile()), 
              child: Column(
                children: [
                  Container(
                    width: 50, 
                    height: 36, 
                    margin: EdgeInsets.only(right: 25,top: 20,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, 
                      image: DecorationImage(
                        image: AssetImage("assets/icon_profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

      ), preferredSize: Size.fromHeight(90)),
      body: Column(
  children: [
    Container(
      padding: EdgeInsets.fromLTRB(21, 10, 21, 5),
      child: CardHome(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            "Data Sapi Anda",
            style: TextStyle(
              fontFamily: "Poppins-SemiBold",
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
    Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _card.length,
                itemBuilder: (context, index) {
                  return CardAlat(
                    namasapi: _card[index].namasapi,
                    suhu: _card[index].suhu,
                    detak: _card[index].detak,
                    suhu1hari: _card[index].suhu1hari,
                    detak1hari: _card[index].detak1hari,
                    
                  );
                },
              ),
      ),
    ),
  ],
),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFF39715C),
        style: TabStyle.fixed,
        items: [
          TabItem(icon: Icons.add, title: 'Tambah Alat',fontFamily: "Ranchers-Regular", ),
          TabItem(icon: CupertinoIcons.camera_fill, title: 'Identifikasi Sapi', fontFamily: "Ranchers-Regular",),
          TabItem(icon: CupertinoIcons.person, title: 'Profile', fontFamily: "Ranchers-Regular",),
        ],
       onTap: (int index) {
          switch (index) {
            case 0:
              Get.to(tambahalat());
              break;
            case 1:
              Get.to(CameraPage());
              break;
            case 2:
              // goPRofile();
              Get.to(ProfilePage());
              break;
            default:
              break;
          }
        },
  )
      ),   
    );
    
  }
}