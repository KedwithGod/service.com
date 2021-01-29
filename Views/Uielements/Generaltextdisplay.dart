import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Shared.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double textFontSize;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final FontStyle style;

  GeneralTextDisplay(this.inputText,this.textColor, this.noOfTextLine, this.textFontSize,
      this.textFontWeight, this.textSemanticLabel,{this.style});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
      child: Text(
        inputText,
        style: TextStyle(
          color: textColor,

          fontSize:
              textFontSize,
          fontWeight: textFontWeight,
          fontStyle: style,
        ),
        maxLines: noOfTextLine,
        semanticsLabel: textSemanticLabel,
        textAlign: TextAlign.left,
      ),
    );
  }
}
