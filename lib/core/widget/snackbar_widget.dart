import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum SnackBarCases {
  SUCCESS,
  ERROR
}

class BuildSnackBar{
  void showSnackBar({required BuildContext context, required String message, required SnackBarCases snackBarCases}){
    switch(snackBarCases){
      case SnackBarCases.SUCCESS:
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  message,
                  style: GoogleFonts.cairo(
                      color: Colors.white
                  ),
                )
            ));
        break;
      case SnackBarCases.ERROR:
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  message,
                  style: GoogleFonts.cairo(
                      color: Colors.white
                  ),
                )
            ));
        break;
    }

  }
}