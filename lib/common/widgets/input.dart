import 'package:flutter/material.dart';
import 'package:my_flutter_app/common/utils/utils.dart';
import 'package:my_flutter_app/common/values/values.dart';

Widget inputTextEdit({
  @required TextEditingController controller,
  double marginTop = 15,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(16),
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}
