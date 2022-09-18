import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../painters/painters.dart';

class PressStart2PlayTextStyles {
  static final p2s10h2black = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 10,
          height: 2,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor)); //Color(0xFF161616)

  static final p2s20black = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor)); //Colors.black54

  static final p2s14black = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          fontSize: 14,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor[2]));

  static final p2s14 = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 14,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor));

  static final p2sFormStyle = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 15,
          decoration: TextDecoration.none,
          color: Painters.formText));

  static final p2sWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          decoration: TextDecoration.none, color: Painters.nextTextColor[3]));

  static final p2sBlack54 = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          decoration: TextDecoration.none,
          color: Painters.nextTextColor)); //Colors.black54

  static final p2sBlack = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          decoration: TextDecoration.none,
          color: Painters.nextTextColor[2])); //Painters.nextTextColor

  static final p2sAlert = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 9,
          decoration: TextDecoration.none,
          color: Painters.alertText));

  static final p2s24black = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 24,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor)); //Colors.black54

  static final p2s13black54 = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 13,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor)); //Colors.black54

  static final p2s13white = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          fontSize: 13,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor[3]));

  static final p2s13blackFF161616 = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 13,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor));

  static final p2s16blackFF161616 = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          fontSize: 16,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor));

  static final p2s16white = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          fontSize: 16,
          decoration: TextDecoration.none,
          color: Painters.nextTextColor[3]));

  static final p2sGray = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          decoration: TextDecoration.none, color: Painters.nextTextColor[4]));
}
