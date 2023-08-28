import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardAlat extends StatelessWidget {
  final String namasapi;
  final String suhu;
  final String detak;
  final String suhu1hari;
  final String detak1hari;

  CardAlat({
    required this.namasapi,
    required this.suhu,
    required this.detak,
    required this.suhu1hari,
    required this.detak1hari,
  });

  @override
  Widget build(BuildContext context) {
    bool showWarning = double.parse(suhu1hari) < 36 || double.parse(suhu1hari) > 40 ||
        double.parse(detak1hari) < 40 || double.parse(detak1hari) > 84;
    return Container(
      height: 130,
      margin: EdgeInsets.only(top: 3, bottom: 2,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Card(
        child: Row(
          children: [
            
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              width: 70,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/sapi.jpg'),
              ),
            ),
            Container(width: 5),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              width: 200,
              child: Column(
                children: [
                  if (showWarning)
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          Text("segera cek sapi anda",
                          style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                            ),
                        ),
                        Container(width: 5,),
                        Container(
                          //height: 1,
                          child: Icon(CupertinoIcons.exclamationmark_circle_fill, color: Colors.red,),
                        ),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 140, 5),
                    child: Text(namasapi,
                        style: TextStyle(
                        fontFamily: "Poppins-SemiBold",
                        fontSize: 19,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.red,
                        ),
                        Container(width: 5),
                        Text("Suhu  : $suhu C"),
                      ],
                    ),
                  ),
                  Container(height: 5,),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.graph_circle,
                          color: Colors.red,
                        ),
                        Container(width: 5),
                        Text("Detak : $detak /BpM"),
                      ],
                    ),
                  ),
                  Container(height: 5,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
