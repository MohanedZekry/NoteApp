import 'package:flutter/material.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';

class NoteDetailsFormWidget extends StatefulWidget {
  final bool isUpdate;
  final Note? note;

  const NoteDetailsFormWidget({Key? key, required this.isUpdate, this.note}) : super(key: key);

  @override
  State<NoteDetailsFormWidget> createState() => _NoteDetailsFormWidgetState();
}

class _NoteDetailsFormWidgetState extends State<NoteDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _bodyController = TextEditingController();


  @override
  void initState() {
    if(widget.isUpdate){
      _titleController.text = widget.note!.title;
      _bodyController.text = widget.note!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
