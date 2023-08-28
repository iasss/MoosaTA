import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moosa/view/Home/home.dart';
import 'package:tflite/tflite.dart';

class DisplayPage extends StatefulWidget {
  final String imagePath;

  DisplayPage(this.imagePath);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

  late String _result= '';

  @override
  void initState() {
    super.initState();
    _loadModelAndPredict();
  }

  void _loadModelAndPredict() async {
    Tflite.close();
    String modelPath = 'assets/dataset/model.tflite'; 
    await Tflite.loadModel(
    model: modelPath,
    labels: 'assets/dataset/labels.txt', 
    );

    var recognitions = await Tflite.runModelOnImage(
      path: widget.imagePath,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2, 
    );

    setState(() {
      _result = recognitions?[0]['label']; 
      
    });
  }

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
        title: Text('Hasil Deteksi'),
        leading: IconButton( onPressed: () {
          Get.back();
        },
          icon: Icon(CupertinoIcons.back),
          color: Colors.white,
          ),
      ),
      body: Center(
        child:Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
              SizedBox(width: 23,),
              Text(
              'Hasil deteksi penyakit sapi anda :',
              style: TextStyle(fontSize: 14, fontFamily: "Poppins-SemiBold", fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
              
            ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 300,
              width: 280,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              child: Center(
                child: Image.file(File(widget.imagePath)),
              ),),
              SizedBox(height: 30,),
              Container(
                width: 320,
                height: 90,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), 
                  blurRadius: 5, 
                  spreadRadius: 1, 
                  offset: Offset(0, 2), 
                  ),
              ],),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,),
                    height: 50,
                    width: 52,
                    child: Image(image: AssetImage('assets/alert.png')),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: 200,
                    child: 
                    // ignore: unnecessary_null_comparison
                    _result.isNotEmpty
                      ? _result == '1 SapiSehat'
                       ? Text(
                        'Sapi Anda Sehat ! tetap pantau kesehatan sapi anda !',
                        style: TextStyle(fontSize: 14, fontFamily: "Poppins-SemiBold", fontWeight: FontWeight.bold,),
                        overflow: TextOverflow.visible,)
                       : _result == '0 SapiLumpy'
                        ? Text(
                        'Sapi Anda Positif Terkena Lumpy ! Segera Periksakan ke Dokter',
                        style: TextStyle(fontSize: 14, fontFamily: "Poppins-SemiBold", fontWeight: FontWeight.bold,),
                        overflow: TextOverflow.visible,)
                        : Text('Gambar tidak teridentifikasi sebagai Sapi ! harap ambil gambar lain.')
                      : Text('tidak terdeteksi'),
                  ),
                ],
              ),
              ),
              SizedBox(height: 30,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                  child: Text('Ulangi'),
                  onPressed: () {
                    Get.back(); },
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  ),
                  child: Text('Kembali'),
                  onPressed: () {
                    Get.off(HomePage()); },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    @override
    void dispose() {
      Tflite.close();
      super.dispose();
    }
  }






