import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';

class NoteListWidget extends StatelessWidget {
  final List<Note> notes;
  const NoteListWidget({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
      ),
      itemBuilder: (context, index) => ListTile(
        onTap: (){

        },
        leading: Text(
          notes[index].id.toString(),
          style: GoogleFonts.cairo(

          ),
        ),
        title: Text(
          notes[index].title,
          style: GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.w600
          ),
        ),
        subtitle: Text(
          notes[index].body,
          style: GoogleFonts.cairo(
              fontSize: 16,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      itemCount: notes.length,

    );
  }
}
