import 'package:app_ui_whatsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/botton_navigation_bar.dart';
import 'widgets/floating_button.dart';
import 'widgets/histories.dart';
import 'widgets/icon_appbar.dart';
import 'widgets/messages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.kBackground,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.greenAccent[700],
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconAppBar(iconData: Icons.nights_stay),
          IconAppBar(iconData: Icons.search),
          GestureDetector(
            onLongPress: () {
              print("Loooong");
            },
            child: IconAppBar(iconData: Icons.more_horiz),
          )
        ],
      ),
      body: Stack(
        children: [
          Histories(),
          Messages(),
          BottonNavigationBar(),
          FloatingButton()
        ],
      ),
    );
  }
}










/*
Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.green,
            child: Center(
              child: Text(
                "1",
                style: TextStyle(fontSize: 60.0, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment,
            child: Container(
              height: 200.0,
              color: Colors.red,
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(fontSize: 60.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 400,
            right: 0,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.pink,
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(fontSize: 60.0, color: Colors.white),
                ),
              ),
            ),
          ),
 */
