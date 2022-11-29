import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/core/network/dio_helper.dart';
import 'package:noteapp/feature/notes/presentation/controller/note/note_bloc.dart';
import 'package:noteapp/feature/notes/presentation/controller/note_details/note_details_bloc.dart';
import 'package:noteapp/feature/notes/presentation/screens/note_screen.dart';

import 'core/styles/app_theme.dart';
import 'core/di/dependency_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.getIt<NoteBloc>()..add(GetAllNotesEvent())),
          BlocProvider(create: (context) => di.getIt<NoteDetailsBloc>()),
        ],
        child: MaterialApp(
          title: 'Note App',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: const NoteScreen(),
        )
    );
  }
}
