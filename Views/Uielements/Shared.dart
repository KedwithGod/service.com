import 'package:flutter/material.dart';


var searchWidth=0.0;
var giveWidth=1.0;
var giveWidthStart=307.0;
var learnWidth=0.0;

class ResponsiveSize {
  BuildContext context;

  ResponsiveSize(this.context);

  double height(height) {
    return MediaQuery.of(context).size.height * (height);
  }

  double width(width) {
    return MediaQuery.of(context).size.width * (width);
  }
}

BorderRadius adaptiveBorderRadius(context, {double radius}) {
  return BorderRadius.all(
    Radius.circular(
      MediaQuery.of(context).size.height * (radius / 667),
    ),
  );
}

