import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/core/widget/loading_widget.dart';
import 'package:noteapp/feature/notes/presentation/controller/note/note_bloc.dart';
import 'package:noteapp/feature/notes/presentation/widgets/message_display_widget.dart';
import 'package:noteapp/feature/notes/presentation/widgets/note_list_widget.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: buildMainBody(),
      floatingActionButton: buildFloatingBtn(),
    );
  }

  Widget buildMainBody()
  => Padding(
      padding: const EdgeInsets.all(18),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state)
        {
          if(state is LoadingNotesState){
            return const LoadingWidget();
          }else if(state is LoadedNotesState){
            return NoteListWidget(notes: state.notes);
          }else if(state is ErrorNoteState){
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      )
  );

  Widget buildFloatingBtn() => FloatingActionButton(
    onPressed: (){},
    child: const Icon(Icons.add),
  );
}
