import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/pages/restaurant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(
            bottom: 10,
            child: buildResult(),
          )
        ],
      ),
    );
  }

  @override
  void reassemble() async {
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget buildQRView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    onPermissionSet: (ctrl,p) => _onPermissionSet(context, ctrl,p),
  );

  void onQRViewCreated(QRViewController controller){
    controller.resumeCamera();
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) => setState(() => this.barcode = barcode));
  }

  void _onPermissionSet(
      BuildContext context, QRViewController ctrl, bool p
      ) async{
    if(await  Permission.camera.isDenied){
      await Permission.camera.request();
    }
    if(await Permission.camera.isPermanentlyDenied){
      print("Provide access");
    }
    if(await Permission.camera.isDenied){
      print("Denied Access");
    }
  }

  Widget buildResult() {
    if(barcode!=null){
      var code = barcode!.code;
      // print(code);
      var ans = json.decode(code!);
      print(ans["name"]);
      return ElevatedButton(
        onPressed: (){
          print("Entering Restaurant");
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RestaurantPage(restaurantName: ans["name"], restaurantTable: ans["table"],)));
        }, 
        style: ElevatedButton.styleFrom(
          primary: Color(0xff272343)
        ),
        child: Text("${ans["name"]}")
      );
    }
    else{
      return Text("Error!");
    }
  }

}

