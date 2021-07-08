import 'package:app_ui_whatsapp/models/user_model.dart';
import 'package:app_ui_whatsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottonNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .1,
        color: AppTheme.kBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _option(
              isSelected: true,
              status: true,
              text: "Chats",
              counter: 10,
            ),
            _option(
              isSelected: false,
              status: true,
              text: "Grupos",
              counter: 5,
            ),
            _option(
              isSelected: false,
              status: false,
              text: "Estados",
              counter: 0,
            ),
            _option(
              isSelected: false,
              status: false,
              text: "Llamadas",
              counter: 0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _option({bool isSelected, bool status, String text, int counter}) {
  return Container(
    width: 100.0,
    height: 100.0,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 80.0,
            height: 35.0,
            decoration: BoxDecoration(
              color:
                  isSelected ? Colors.greenAccent[700] : AppTheme.kBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppTheme.kDarkBlue,
                ),
              ),
            ),
          ),
        ),
        if (status)
          Positioned(
            right: 5.0,
            top: 10.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 13.0,
              child: CircleAvatar(
                radius: 11.0,
                backgroundColor: Colors.greenAccent[700],
                child: Text(
                  "$counter",
                  style: TextStyle(fontSize: 11.0, color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
