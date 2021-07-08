import 'package:app_ui_whatsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class IconAppBar extends StatelessWidget {
  IconAppBar({this.iconData});

  final iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: CircleAvatar(
        backgroundColor: AppTheme.kLigth,
        child: Center(
          child: Icon(iconData, color: AppTheme.kDarkBlue),
        ),
      ),
    );
  }
}
