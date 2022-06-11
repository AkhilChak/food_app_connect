import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/pages/qr_scanner.dart';
import 'package:project/utils.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appBarColor,
        title: Text(
          "Food Connect",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          PermissionStatus status = await _getCameraPermission();
          if (status.isGranted) {
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => const QRScanner()));
          }
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }
}