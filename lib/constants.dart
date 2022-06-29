import 'package:flutter/material.dart';

TextStyle labelTextStyles = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14,
  color: Color.fromRGBO(153, 153, 153, 1),
);

TextStyle hintTextStyles = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 13,
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(153, 153, 153, 1),
);

InputDecorationTheme textFeildInputDecoration = InputDecorationTheme(
  fillColor: Colors.grey[200],
  filled: true,
  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
  ),
  labelStyle: labelTextStyles,
  hintStyle: hintTextStyles,
);
