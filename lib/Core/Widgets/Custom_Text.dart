import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/Colors.dart';

Widget customText({
  required String label,
  required colour,
  required weight,
  required double fontsize,
}) {
  return Text(
    overflow: TextOverflow.ellipsis,
      label,
      style: GoogleFonts.aBeeZee(
        color: colour,
        fontSize: fontsize,
        fontWeight: weight,
      ));
}
