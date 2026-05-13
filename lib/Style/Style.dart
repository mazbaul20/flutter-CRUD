import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const darkBlue = Color.fromRGBO(33, 191, 115, 1);

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      mainAxisExtent: 250,
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );

}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

ScreenBackground(context){
  return SvgPicture.asset(
   'assets/images/screen-bg.svg',
   // 'assets/images/sr-bg.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.contain,
  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: colorWhite, width: 1),
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: child,
      ),
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 1,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

Ink SuccessButtonStyle(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
        height: 45,
        alignment: Alignment.center,
        child: Text(ButtonText, style: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorWhite,
        ),),
    ),
  );
}

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