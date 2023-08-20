import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(height: 10),
        itemCount: 5,
        itemBuilder: ((context, index) {
          /// Show conversation
          return Container(
            color: Colors.white,
            // !conversation[MESSAGE_READ]
            //     ? Theme.of(context).primaryColor.withAlpha(40)
            //     : null,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage:
                NetworkImage("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
              ),
              title: Text('Saras',
                  style: TextStyle(fontSize: 18)),
              subtitle: Text("Hi there, how are you"),
              // conversation[MESSAGE_TYPE] == 'text'
              //     ? Text("${conversation[LAST_MESSAGE]}\n"
              //     "${timeago.format(conversation[TIMESTAMP].toDate())}")
              //     : Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     Icon(Icons.photo_camera,
              //         color: Theme.of(context).primaryColor),
              //     SizedBox(width: 5),
              //     Text("photo"),
              //   ],

              // trailing: !conversation[MESSAGE_READ]
              //     ? b.Badge(text: i18n.translate("new"))
              //     : null,
              // onTap: () async {
              //   /// Hide progrees
              //   pr.hide();
              //
              //   /// Go to chat screen
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => ChatScreen(user: user)));

            ),
          );
        }),
      ),
    );
  }
}
