import 'dart:ui';

import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const darkBlue = Color.fromRGBO(33, 191, 115, 1);

InputDecoration AppInputDecoration(String name){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1),
    ),

    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0),
    ),
    labelText: name,

  );
}