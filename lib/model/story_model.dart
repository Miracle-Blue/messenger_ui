import 'package:flutter/material.dart';
import 'package:messenger_ui/model/theme_model.dart';
import 'package:messenger_ui/model/user_model.dart';

class StoryModel extends StatefulWidget {
  final User user;

  const StoryModel({Key? key, required this.user}) : super(key: key);

  @override
  _StoryModelState createState() => _StoryModelState();
}

class _StoryModelState extends State<StoryModel> {
  @override
  Widget build(BuildContext context) {
    currentTheme.addListener(() {setState(() {});});
    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Container(
        height: 77,
        width: 65,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color.fromARGB(5, 0, 0, 0),
                  child: Stack(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          image: DecorationImage(
                            image: AssetImage(widget.user.userImage),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      widget.user.isActive ? Positioned(
                        top: 35,
                        left: 35,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2, color: CustomTheme.isDarkTheme ? Colors.black : Colors.white,),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                      ) : const SizedBox.shrink(),
                    ],
                  )
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              widget.user.userName,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
