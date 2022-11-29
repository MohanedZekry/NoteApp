import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/core/widget/loading_widget.dart';
import 'package:noteapp/core/widget/snackbar_widget.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';
import 'package:noteapp/feature/notes/presentation/controller/note_details/note_details_bloc.dart';

import '../../../../core/animation/route_transition.dart';
import 'note_screen.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note? note;
  final bool isUpdate;
  const NoteDetailsScreen({Key? key, this.note, required this.isUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Edit Note' : 'Add Note',
        ),
      ),
      body: buildForm(),
    );
  }

  Widget buildForm() =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocConsumer<NoteDetailsBloc,NoteDetailsState>(
            listener: (context, state) {
              if(state is SuccessfulNoteDetailsState){
                BuildSnackBar().showSnackBar(context: context, message: state.message, snackBarCases: SnackBarCases.SUCCESS);
                Navigator.of(context).pushAndRemoveUntil(
                    RouteTransition(destination: const NoteScreen()),
                        (route) => false);
              }else if(state is ErrorNoteDetailsState){
                BuildSnackBar().showSnackBar(context: context, message: state.message, snackBarCases: SnackBarCases.ERROR);
              }
            },
            builder: (context, state) {
              if(state is LoadingNoteDetailsState){
                return const LoadingWidget();
              }else {
                return Container();
              }
            },
          ),
        ),
      );


}
