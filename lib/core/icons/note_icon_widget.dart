import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'note_icon.dart';

class NoteIconWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool? isRepeat;
  final NoteIcon noteIcon;

  const NoteIconWidget(
      {Key? key,
      required this.noteIcon,
      required this.width,
      required this.height,
      this.isRepeat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(
        'assets/images/${noteIcon.name}.json',
        width: width,
        repeat: isRepeat ?? false,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
