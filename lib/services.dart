import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

var url = "http://127.0.0.1:8000/";

class Network{
  Future<bool> getOtp(phoneNumber) async{
    print("inside login function");
    var data=phoneNumber;
    // final res = await http.post(Uri.parse(url+"phoneAuth/"), body: jsonEncode(data));
    // if(res.statusCode == 200){
    //   print("Sent eq");
    //   final data = jsonDecode(res.body);
    //   return data;
    // }
    return true;
  }

  Future<bool> login(otp) async{
    return true;
  }

}