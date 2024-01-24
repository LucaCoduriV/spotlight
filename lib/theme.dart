import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static Color backgroundColor = const Color(0xFF181818).withOpacity(0.6);
  static Color selectionColor = Colors.white.withOpacity(0.1);
  static Color textColor = const Color(0xFFF2F2F2);

  static final text = GoogleFonts.roboto();

  static final headerText = text.copyWith(
    color: textColor.withOpacity(0.8),
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static final hintText = text.copyWith(
    color: textColor.withOpacity(0.6),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final primaryText = text.copyWith(
    color: textColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static final secondaryText = text.copyWith(
    color: textColor.withOpacity(0.6),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
