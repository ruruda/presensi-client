import 'package:client/app/routes/app_pages.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeController extends GetxController {
  Map<String, dynamic> decode = JwtDecoder.decode(GetStorage().read("access_token"));
  final menuItems = [
    {
      "title": "Scanner",
      "icon": Icons.qr_code_scanner,
      "color": const Color(0xff10A5D8),
      "onTap": () async {
        var barcode =
            await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.QR);
        // print("BANGKE: ${barcode}");

        barcode == "-1" ? null : Get.snackbar("Code", barcode);
      },
    },
    {
      "title": "Code",
      "icon": Icons.paste,
      "color": const Color(0xffF3B52A),
      "onTap": () => print("Code"),
    },
    {
      "title": "List Presensi",
      "icon": Icons.list_alt_rounded,
      "color": const Color(0xffF3745A),
      "onTap": () => print("List presensi"),
    },
    {
      "title": "Account",
      "icon": Icons.person,
      "color": const Color(0xff065A4C),
      "onTap": () {
        GetStorage().remove("access_token");
        Get.offAllNamed(Routes.LOGIN);
      }
    },
  ];
}
