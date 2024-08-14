import 'package:flutter/material.dart';

mixin SnackbarMixins<T extends StatefulWidget> on State<T> {
  showSnackBarError(String text, {required SnackBarAction action}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red.shade700,
        action: action,
      ),
    );
  }
}
