import 'package:flutter/material.dart';

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////
const productsAddDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20)),
  boxShadow: [
    BoxShadow(
        color: Color(0x1a000000),
        offset: Offset(0, 0),
        blurRadius: 5,
        spreadRadius: 0)
  ],
);

const Heading4Style = TextStyle(
  fontSize: 12,
  color: Color(0xFF8CA2AE),
  letterSpacing: 0,
  fontWeight: FontWeight.w600,
);

const Body1Style = TextStyle(
  fontSize: 14,
  color: Color(0xFF1DC778),
  letterSpacing: 0,
  fontWeight: FontWeight.w600,
  decoration: null,
);
