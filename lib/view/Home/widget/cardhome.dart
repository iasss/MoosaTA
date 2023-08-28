import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 160,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF39715C),
        borderRadius: BorderRadius.circular(10),
        
        
          
      ),
      child: 
      Row(children: [
       Container(
            width: 150, 
            margin: EdgeInsets.fromLTRB(8, 5, 0, 80),   
            child: Text("Pantau Sapi Anda Dengan Mudah!", 
            style: TextStyle(fontFamily: "Poppins-Medium", 
            fontSize: 15, color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w500)),  
            
           
        ),
        Container(
          
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/cardhome.png"))
          ),         
        ),
        
      ],),
    );
  }
}