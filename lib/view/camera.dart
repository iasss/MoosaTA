import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moosa/view/display_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  Future<void> _takePicture() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      Get.to(DisplayPage(image.path));
    }
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.to(DisplayPage(image.path));
    }
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
        title: Text('Deteksi Lumpy'),
        leading: IconButton( onPressed: () {
          Get.back();
        },
          icon: Icon(CupertinoIcons.back),
          color: Colors.white,
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              alignment: Alignment.center, 
              child: Image(
                image: AssetImage('assets/default.jpg'), 
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 18, right: 18,),
              child: Text(
              'Silahkan memasukkan gambar bagian sapi anda yang sakit !',
              style: TextStyle(fontSize: 18, ),
              textAlign: TextAlign.center,
            ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  ),
                  child: Text('Dari Kamera'),
                  onPressed: () {
                    _takePicture();
                  },
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF39715C),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  ),
                  child: Text('Dari Galeri'),
                  onPressed: _pickImageFromGallery,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }

