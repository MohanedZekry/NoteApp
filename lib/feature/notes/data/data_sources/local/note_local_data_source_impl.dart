import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/exceptions.dart';
import 'package:noteapp/core/utils/constants.dart';
import 'package:noteapp/feature/notes/data/data_sources/local/note_local_data_source.dart';
import 'package:noteapp/infrastructure/shared_preferences.dart';
import '../../models/note_model.dart';

class NoteLocalDataSourceImpl implements NoteLocalDataSource {

  @override
  Future<Unit> cacheNote(List<NoteModel> noteModel) {
    SharedPreferencesHelper.setData(Constants.CACHED_NOTES,
        json.encode(
            noteModel.map((e) => e.toJson()).toList()
        )
    );
    return Future.value(unit);
  }

  @override
  Future<List<NoteModel>> getAllSavedNotes() {

    final jsonString = SharedPreferencesHelper.getData(key: Constants.CACHED_NOTES);

    if(jsonString != null){
      List decodeJson = json.decode(jsonString);
      List<NoteModel> list = decodeJson.map((e) => NoteModel.fromJson(e)).toList();
      return Future.value(list);
    }else{
      throw NoDataException();
    }

  }

}