import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';
import 'package:noteapp/feature/notes/presentation/controller/note_details/note_details_bloc.dart';

class NoteDetailsFormWidget extends StatefulWidget {
  final bool isUpdate;
  final Note? note;

  const NoteDetailsFormWidget({Key? key, required this.isUpdate, this.note}) : super(key: key);

  @override
  State<NoteDetailsFormWidget> createState() => _NoteDetailsFormWidgetState();
}

class _NoteDetailsFormWidgetState extends State<NoteDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();


  @override
  void initState() {
    if(widget.isUpdate){
      _titleController.text = widget.note!.title;
      _bodyController.text = widget.note!.body;
    }
    super.initState();
  }

  void validateFormThenProcess(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      final note = Note(id: widget.isUpdate? widget.note!.id : null, title: _titleController.text, body: _bodyController.text);
      if(widget.isUpdate){
        context.read<NoteDetailsBloc>().add(UpdateNoteEvent(note: note));
      }else{
        context.read<NoteDetailsBloc>().add(AddNoteEvent(note: note));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: TextFormField(
              controller: _titleController,
              validator: (val) => val!.isEmpty ? 'Please enter title' : null,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.info),
                  hintText: 'Title'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: TextFormField(
              controller: _bodyController,
              validator: (val) => val!.isEmpty ? 'Please enter body' : null,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.info),
                hintText: 'Body',
              ),
              minLines: 6,
              maxLines: 6,
            ),
          ),
          ElevatedButton.icon(
            onPressed: (){
              validateFormThenProcess();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black
            ),
            icon: Icon(widget.isUpdate ? Icons.update :  Icons.add),
            label: Text(
              widget.isUpdate ? 'Update' : 'Add',
              style: GoogleFonts.cairo(),
            ),
          )
        ],
      ),
    );
  }
}
