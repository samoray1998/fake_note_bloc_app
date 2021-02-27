import 'package:flutter/material.dart';

AppBar myAppbar(String tittle) {
  return AppBar(
    title: Text(
      tittle,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0.4,
  );
}
