import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils.dart';

class ViewBill extends StatelessWidget {

  final billItems = [
    {
      "name":"Edward's Nuts",
      "quantity":"2",
      "price":"80"
    },
    {
      "name":"Charlie's Pizza",
      "quantity":"5",
      "price":"40"
    },
    {
      "name":"Rambo's rage",
      "quantity":"10",
      "price":"10"
    },
    {
      "name":"Caeser's salad",
      "quantity":"1",
      "price":"100"
    }
  ];
  // var totalSum=0;
  // billItems.forEach((element) {
  //   var amt = int.parse(element["quantity"]!)*int.parse(element["price"]!);
  //   totalSum+ = amt;
  //   return totalSum; 
  // },)

  ViewBill({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          elevation: 1,
          title: Text(
              "View Bill",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: ColorManager.appBarColor
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text("Sr No"),
            trailing: Wrap(
              spacing: 12,
              children: [
                Text("Qty"),
                Text("Price"),
              ],
            ),
            title: Text("Food Item"),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Text((index+1).toString()),
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    Text(billItems[index]["quantity"]!),
                    Text(billItems[index]["price"]!),
                  ],
                ),
                title: Text(billItems[index]["name"]!),
              );
            },
            itemCount: billItems.length
          ),
          ListTile(
            title: Text("Total"),
            trailing: Text("560"),
          ),
          SizedBox(height: size.height*0.4,),
          ElevatedButton(
            child: Text("Pay Bill"),
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                    primary: Color(0xff272343)
                  ),)
        ]
      ),
    );
  }
}