import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa9dbd8),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.teal,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          backPage(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.pinimg.com/236x/dd/c5/f6/ddc5f675fe1ca57391a9e2851f348255.jpg",
                      ),
                      radius: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: CustomText(
                            text: "Opah",
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        CustomText(
                          text: "online",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 20, left: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomRight, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffe2ffc7),
              ),
              margin: const EdgeInsets.only(top: 20, right: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomLeft, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 20, left: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomRight, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffe2ffc7),
              ),
              margin: const EdgeInsets.only(top: 20, right: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomLeft, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 20, left: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomRight, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffe2ffc7),
              ),
              margin: const EdgeInsets.only(top: 20, right: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomLeft, child: Icon(Icons.check)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 20, left: 30),
              width: 200,
              height: 60,
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 5),
                child: Align(
                    alignment: Alignment.bottomRight, child: Icon(Icons.check)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 95),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 00),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 350,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.emoji_emotions_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(text: "Ketik Pesan")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_file),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.camera_alt_outlined),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xff01897b),
                  radius: 30,
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
