import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/pages/view_bill.dart';

import '../utils.dart';

class RestaurantPage extends StatefulWidget {
  final restaurantName;
  final restaurantTable;
  const RestaurantPage({ Key? key, this.restaurantName, this.restaurantTable }) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  final menu = [
    {
      "image":"assets/images/food (5).jpg",
      "name":"Edward's nutz",
      "quantity":"0"
    },
    {
      "image":"assets/images/food (6).jpg",
      "name":"Charlie's Pizza",
      "quantity":"0"
    },
    {
      "image":"assets/images/food (7).jpg",
      "name":"Rambo's Rage",
      "quantity":"0"
    },
    {
      "image":"assets/images/food (3).jpg",
      "name":"Caeser's salad",
      "quantity":"0"
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xff272343),
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  child: Text(
                    widget.restaurantName,
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    )
                  ),
                ),
                background: Container(
                  height: 100,
                  child: Image.asset(
                    'assets/images/food (8).jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: 
          [
            ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemCount: menu.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                leading: Image.asset(
                      '${menu[index]["image"]}',
                    ),
                trailing: Wrap(
                  spacing: 12,
                  children: <Widget>[
                    IconButton(onPressed: (){
                      var qty = menu[index]["quantity"];
                      if(qty!=null && int.parse(qty)>0){
                        qty=(int.parse(qty)-1).toString();
                        setState(() {
                          menu[index]["quantity"] = qty!;
                        });
                        print(menu[index]["quantity"]);
                      }
                      
                    },
                      icon: const Icon(Icons.remove)),
                    Text("${menu[index]["quantity"]}"),
                    IconButton(onPressed: (){
                      var qty = menu[index]["quantity"];
                      if(qty!=null){
                        qty=(int.parse(qty)+1).toString();
                        setState(() {
                          menu[index]["quantity"] = qty!;
                        });
                        print(menu[index]["quantity"]);
                      }
                      
                    }, icon: const Icon(Icons.add)),
                  ],
                ),
                title:Text("${menu[index]["name"]}")
                );
            }
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              width: size.width * 0.4,
              child: ElevatedButton(
                child: Text(
                  "View Bill",
                  style: GoogleFonts.lato(),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ViewBill()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff272343)
                ),
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              width: size.width * 0.4,
              child: ElevatedButton(
                child: Text(
                  "Place Order",
                  style: GoogleFonts.lato(),
                ),
                onPressed: (){
                  menu.forEach((element) {
                    element["quantity"]="0";
                  });
                   const snackBar = SnackBar(content: Text("Placed Successfully"),);
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {});
                 
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff272343)
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}