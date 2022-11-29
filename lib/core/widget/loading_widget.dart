import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../styles/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(child: Center(
        child: SpinKitFadingCircle(
          size: 30,
          color: primaryColor,
        ),
      ),
    );
  }
}
