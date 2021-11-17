import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTextStyleBase {

  static TextStyle stats(color){
    return GoogleFonts.poppins(
    color: color,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  }
  static final stats_text = GoogleFonts.poppins(
    color: Color(0xFF212121),
    fontSize: 14.0,
  );
  static final title = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
  );
  static final subtitle = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  static final atribute = GoogleFonts.poppins(
    color: Color(0xFF212121),
    fontSize: 12.0,
  );
  static final atribute_title = GoogleFonts.poppins(
    color: Color(0xFF666666),
    fontSize: 10.0,
  );
  static final type_name = GoogleFonts.poppins(
      color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle cardTitle(color){
    return GoogleFonts.poppins(
    color:color,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  }
}
