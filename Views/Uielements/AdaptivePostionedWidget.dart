import 'package:flutter/material.dart';
import 'Shared.dart';


class AdaptivePositioned extends StatelessWidget {

  final double top;
  final double left;
  final Widget child;

  AdaptivePositioned({this.left,this.child,this.top});
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return Positioned(
        left: dynamicSize.width(left/375),
        top: dynamicSize.height(top/667),
        child: child);
  }
}
