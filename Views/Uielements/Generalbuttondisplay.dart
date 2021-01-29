import 'package:flutter/material.dart';
import 'Shared.dart';
import 'Generaltextdisplay.dart';


class GeneralButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String buttonText;
  final Color buttonTextColor;
  final int noOfTextLine;
  final double buttonTextFontSize;
  final FontWeight buttonTextFontWeight;
  final String buttonSemanticLabel;
  final Function onButtonPress;
  final Color buttonSplashColor;
  final Color buttonColor;
  final double buttonElevation;

  GeneralButton(
      this.noOfTextLine,
      this.buttonSemanticLabel,
      this.buttonText,
      this.buttonTextColor,
      this.buttonTextFontSize,
      this.buttonTextFontWeight,
      this.buttonHeight,
      this.buttonWidth,
      this.onButtonPress,
      this.buttonColor,
      this.buttonSplashColor,
      this.buttonElevation);

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
      child: ButtonTheme(
        height:  buttonHeight,
        minWidth: buttonWidth,
        child: RaisedButton(
          padding:EdgeInsets.symmetric(horizontal:2.0),
          splashColor: buttonSplashColor,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10)

          )),
          onPressed: onButtonPress,
          elevation:  buttonElevation,
          child: GeneralTextDisplay(buttonText, buttonTextColor, noOfTextLine,
              buttonTextFontSize, buttonTextFontWeight, buttonSemanticLabel),
        ),
      ),
    );
  }
}

class GeneralIconButton extends StatelessWidget {
  final Color iconButtonColor;
  final Function onIconButtonPress;
  final Widget iconButtonIcon;
  final double iconButtonHeight;
  final double iconButtonWidth;
  final Color iconButtonSplashColor;

  GeneralIconButton(
      this.iconButtonColor,
      this.iconButtonHeight,
      this.iconButtonIcon,
      this.iconButtonSplashColor,
      this.iconButtonWidth,
      this.onIconButtonPress);

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
      child: IconButton(
        color: iconButtonColor,
        onPressed: onIconButtonPress,
        icon: iconButtonIcon,
        iconSize:  dynamicSize.height(iconButtonHeight / 667),
        splashColor: iconButtonSplashColor,
      ),
    );
  }
}
