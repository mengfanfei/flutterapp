import 'package:flutter/material.dart';
import 'package:my_flutter_app/common/utils/utils.dart';
import 'package:my_flutter_app/common/values/values.dart';

Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color bgColor = AppColors.primaryElement,
  String title = 'button',
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w400,
  String fontFamily = 'Montserrat',
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontSize: duSetFontSize(fontSize),
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ),
    ),
  );
}

Widget btnFlatButtonBorderOnlyWidget({
  double width = 88,
  double height = 44,
  String iconName,
  @required VoidCallback onPressed,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      child: Image.asset('assets/images/icons-$iconName.png'),
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
        side: Borders.primaryBorder,
      ),
      onPressed: onPressed,
    ),
  );
}
