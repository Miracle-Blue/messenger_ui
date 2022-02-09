import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:messenger_ui/model/theme_model.dart';
import 'package:messenger_ui/model/user_model.dart';

class MessagesModel extends StatefulWidget {
  final User user;

  const MessagesModel({Key? key, required this.user}) : super(key: key);

  @override
  _MessagesModelState createState() => _MessagesModelState();
}

class _MessagesModelState extends State<MessagesModel> {
  GlobalKey key = GlobalKey();
  bool isTextRead = true;

  @override
  Widget build(BuildContext context) {
    currentTheme.addListener(() {
      setState(() {});
    });
    return Slidable(
      key: const ValueKey(0),

      /// * onStart
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 20,),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          CircleAvatar(
            radius: 20,
            backgroundColor: CustomTheme.isDarkTheme
                ? const Color.fromARGB(100, 255, 255, 255)
                : const Color.fromARGB(10, 0, 0, 0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          CircleAvatar(
            radius: 20,
            backgroundColor: CustomTheme.isDarkTheme
                ? const Color.fromARGB(100, 255, 255, 255)
                : const Color.fromARGB(10, 0, 0, 0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: Icon(
                Icons.video_camera_back_rounded,
                color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),

      /// * onEnd
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: 25,),
          CircleAvatar(
            radius: 20,
            backgroundColor: CustomTheme.isDarkTheme
                ? const Color.fromARGB(100, 255, 255, 255)
                : const Color.fromARGB(10, 0, 0, 0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          CircleAvatar(
            radius: 20,
            backgroundColor: CustomTheme.isDarkTheme
                ? const Color.fromARGB(100, 255, 255, 255)
                : const Color.fromARGB(10, 0, 0, 0),
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red.shade400,
            child: IconButton(
              splashRadius: 22,
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(widget.user.userImage),
        ),
        title: Text(
          widget.user.userName,
          style: TextStyle(
              color: CustomTheme.isDarkTheme ? Colors.white : Colors.black),
        ),
        subtitle: const Text(
          "You: What’s man! · 9",
          style: TextStyle(color: Colors.grey),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          splashRadius: 22,
          onPressed: () {},
          icon: isTextRead
              ? const Icon(
                  Icons.check_circle_outline,
                  color: Colors.grey,
                  size: 16,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.grey,
                  size: 16,
                ),
        ),
      ),
    );
  }
}
