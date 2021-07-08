import 'package:app_ui_whatsapp/models/user_model.dart';
import 'package:app_ui_whatsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show required;

class Histories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.0,
      color: AppTheme.kBackground,
      padding: EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          //final user = users[index];
          return ItemHistory(
            user: users[index],
          );
        },
      ),
    );
  }
}

class ItemHistory extends StatelessWidget {
  ItemHistory({
    @required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65.0,
          height: 65.0,
          margin: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blueAccent[400],
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.5),
            child: CircleAvatar(
              foregroundImage: AssetImage(user.path),
            ),
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          user.name,
          style: TextStyle(
            fontSize: 12.0,
            color: AppTheme.kDarkBlue,
          ),
        ),
      ],
    );
  }
}
