import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:messenger_ui/model/messages_model.dart';
import 'package:messenger_ui/model/story_model.dart';
import 'package:messenger_ui/model/theme_model.dart';
import 'package:messenger_ui/model/user_model.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  static const String id = "chats_page";

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<User> list = [
    User(
      userImage: "assets/images/img_user.jpg",
      userName: "User 1",
      isActive: true,
    ),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(
      userImage: "assets/images/img_user.jpg",
      userName: "User 1",
      isActive: true,
    ),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(
      userImage: "assets/images/img_user.jpg",
      userName: "User 1",
      isActive: true,
    ),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
    User(userImage: "assets/images/img_user.jpg", userName: "User 1"),
  ];

  @override
  Widget build(BuildContext context) {
    currentTheme.addListener(() {setState(() {});});
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              /// * search
              Container(
                height: size.height * 0.04,
                width: size.width,
                decoration: BoxDecoration(
                  color: CustomTheme.isDarkTheme
                      ? const Color.fromARGB(100, 255, 255, 255)
                      : const Color.fromARGB(10, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    prefixIcon:
                        Icon(Icons.search, color: Colors.grey, size: 22),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ),

              /// * story
              Container(
                width: size.width,
                height: 106,
                padding: const EdgeInsets.only(left: 9.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: Container(
                        height: 77,
                        width: 65,
                        margin: const EdgeInsets.only(
                            left: 7, right: 7, top: 16, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: CustomTheme.isDarkTheme
                                  ? const Color.fromARGB(100, 255, 255, 255)
                                  : const Color.fromARGB(10, 0, 0, 0),
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: CustomTheme.isDarkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              "Your Story",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ...list.map((e) => StoryModel(user: e)).toList(),
                  ],
                ),
              ),

              /// * messages
              ...list.map((e) => MessagesModel(user: e)).toList(),
              const SizedBox(height: 160)

              /// ! for catching hide users
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 80,
                child: CustomTheme.isDarkTheme ? Image.asset(
                  "assets/images/im_ad_dark.png",
                  fit: BoxFit.cover,
                ) : Image.asset(
                  "assets/images/im_ad.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.messenger,
                              color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.group,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                top: 9,
                                left: 26,
                                child: Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: CustomTheme.isDarkTheme ? Colors.green.shade500 : Colors.green.shade50,
                                    border: Border.all(
                                      width: 1,
                                      color: CustomTheme.isDarkTheme ? Colors.black : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: CustomTheme.isDarkTheme ? Colors.green.shade100 : Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.my_location,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Align(
        alignment: Alignment.center,
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(list[0].userImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: const Text("Chats"),
      centerTitle: false,
      actions: [
        CircleAvatar(
          radius: 20,
          backgroundColor: CustomTheme.isDarkTheme
              ? const Color.fromARGB(100, 255, 255, 255)
              : const Color.fromARGB(10, 0, 0, 0),
          child: IconButton(
            splashRadius: 22,
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt,
              color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 20),
        CircleAvatar(
          radius: 20,
          backgroundColor: CustomTheme.isDarkTheme
              ? const Color.fromARGB(100, 255, 255, 255)
              : const Color.fromARGB(10, 0, 0, 0),
          child: IconButton(
            splashRadius: 22,
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: Image.asset(
              "assets/images/im_icon.png",
              color: CustomTheme.isDarkTheme ? Colors.white : Colors.black,
              width: 19,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
