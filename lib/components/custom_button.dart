import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  CustomAddButton({this.icon, this.ontap});
  final icon;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ontap,
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      fillColor: Colors.black54,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
    );
  }
}
