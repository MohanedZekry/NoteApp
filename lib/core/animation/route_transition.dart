import 'package:flutter/cupertino.dart';

class RouteTransition extends PageRouteBuilder {

  final Widget destination;

  RouteTransition({required this.destination}) : super(
      pageBuilder: (context, animation, animationTwo) => destination,
      transitionsBuilder: (context, animation, animationTwo, child)
      {
        var end = Offset.zero;
        var begin = const Offset(0.0, 1.0);
        var tween = Tween(begin: begin, end: end);
        /// Using Curved Animation ///
        var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return SlideTransition(position: tween.animate(curvedAnimation), child: child,);
      }
  );

}