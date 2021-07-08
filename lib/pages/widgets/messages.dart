import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:app_ui_whatsapp/models/user_model.dart';
import 'package:app_ui_whatsapp/theme/app_theme.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .74,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mensajes",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tienes dos nuevos mensajes",
                        style: TextStyle(
                          //fontSize: 28.0,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  //Spacer(),
                  Icon(
                    Icons.inventory,
                    color: AppTheme.kDarkBlue,
                  ),
                ],
              ),
            ),

            //Chats----------->>>>>>
            Expanded(
              child: Chats(),
            ),
          ],
        ),
      ),
    );
  }
}

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 70.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ItemChat(user: users[index]);
          //return;
        },
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  ItemChat({
    @required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: ListTile(
            title: Text(
              "${user.name} ${user.lastname}",
              style: TextStyle(
                fontSize: 15.0,
                color: AppTheme.kDarkBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              user.message,
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.black38,
              ),
            ),
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 26.0,
                  foregroundImage: AssetImage(user.path),
                ),
                if (user.status)
                  Positioned(
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 7.5,
                      child: CircleAvatar(
                        radius: 5.0,
                        backgroundColor: Colors.greenAccent[700],
                      ),
                    ),
                  ),
              ],
            ),
            trailing: Text(
              '10:00 am',
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: AppTheme.kLigth,
          icon: Icons.more_horiz,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete_outline_rounded,
          onTap: () {},
        ),
      ],
    );
  }
}
