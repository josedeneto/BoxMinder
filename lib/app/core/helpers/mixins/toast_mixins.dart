import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMixins <T extends StatefulWidget> on State<T>{


  showToast(String text){
    return  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      backgroundColor: const Color.fromARGB(100, 0, 0, 0),
    );
  }
}