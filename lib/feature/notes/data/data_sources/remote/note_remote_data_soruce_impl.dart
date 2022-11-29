import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/exceptions.dart';
import 'package:noteapp/core/network/dio_helper.dart';
import 'package:noteapp/core/utils/constants.dart';
import 'package:noteapp/feature/notes/data/data_sources/remote/note_remote_data_source.dart';
import 'package:noteapp/feature/notes/data/models/note_model.dart';

class NoteRemoteDataSourceImpl implements NoteRemoteDataSource {

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final response = await DioHelper.getData(url: Constants.NOTE_EP);
      print(response.data);
      if (response.statusCode == 200) {
        return List<NoteModel>.from(
            (response.data as List).map((e) => NoteModel.fromJson(e))
        );
      } else {
        throw ServerException();
      }
    } catch(_){
      throw SocketException();
    }
  }

  @override
  Future<Unit> addNote(NoteModel noteModel) async {

    final body = {
      'title' : noteModel.title,
      'body' : noteModel.body
    };

    final response = await DioHelper.postData(path: Constants.NOTE_EP,
        data: body
    );
    if(response.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateNote(NoteModel noteModel) async {
    final body = {
      'title' : noteModel.title,
      'body' : noteModel.body
    };

    final response = await DioHelper.updateData(path: '${Constants.NOTE_EP}/${noteModel.id.toString()}',
        data: body
    );
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteNote(int id) async {
    final response = await DioHelper.deleteData(url: '${Constants.NOTE_EP}/${id.toString()}');
    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

}