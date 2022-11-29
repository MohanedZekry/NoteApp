import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/core/icons/note_icon.dart';
import 'package:noteapp/core/icons/note_icon_widget.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;

  const MessageDisplayWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NoteIconWidget(noteIcon: NoteIcon.error, width: 150, height: 150),
              Text(
                message,
                style: GoogleFonts.alef(
                  fontSize: 21,
                  color: Colors.red[800]
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
