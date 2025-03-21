import 'package:flutter/material.dart';

import 'Custom_Text.dart';

Widget customButtonWhiteText({
  required String label,
  required Color colour,
  required VoidCallback onPressed,
}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colour,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15),
        child:
        customText(
            label: label,
            colour: Color(0xffffffff),
            weight: FontWeight.w800,
            fontsize: 14),
    
      ),
    ),
  );
}