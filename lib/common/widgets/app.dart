import 'package:flutter/material.dart';

Widget transparentAppBar({
  @required BuildContext context,
  Widget leading,
  Widget title,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}
