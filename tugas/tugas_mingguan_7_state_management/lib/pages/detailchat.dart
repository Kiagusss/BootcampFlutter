import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/post_bloc.dart';
import '../model/post_model.dart';
import '../services/post_repository.dart';

class ChatDetailPage extends StatelessWidget {
  final int id;

  const ChatDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostBloc(PostRepository())..add(LoadPostDetailEvent(id)),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600"),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lock,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                        if (state is PostDetailLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is PostDetailLoadedState) {
                          return SizedBox(
                            width: 150,
                            child: Text(
                              state.post.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      }),
                    ],
                  ),
                  const CustomText(
                    text: "online",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2AABEE),
                  ),
                ],
              )
            ],
          ),
          actions: const [
            Icon(Icons.call),
            SizedBox(width: 20),
            Icon(Icons.more_vert),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ChatMessage(
                    text: null,
                    isSentByMe: false,
                    imageUrls: [
                      "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                      "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                      "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                    ],
                  ),
                  ChatMessage(
                    text: 'Oh yes this look great!',
                    isSentByMe: true,
                  ),
                  ChatMessage(
                    text: 'Thank You',
                    isSentByMe: false,
                  ),
                  ChatMessage(
                    text: 'Sudah capek, maaf klo gk mirip',
                    isSentByMe: true,
                  ),
                  ChatMessage(
                    text: 'Iyaa gapapa, btw drawer di home bisa dipencet',
                    isSentByMe: false,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Icon(Icons.attachment_sharp),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.insert_emoticon,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.mic,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        fillColor: const Color(0xffE2F5FD),
                        filled: true,
                        focusColor: const Color(0xff2AABEE),
                        hoverColor: const Color(0xff2AABEE),
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String? text;
  final bool isSentByMe;
  final List<String>? imageUrls;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isSentByMe,
    this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          imageUrls != null
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: isSentByMe
                        ? const Color(0xff2AABEE)
                        : const Color(0xffE2F5FD),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    text ?? "Kiagus",
                    style: TextStyle(
                      fontSize: 21,
                      color: isSentByMe ? Colors.white : Colors.black,
                    ),
                  ),
                ),
          if (imageUrls != null) const SizedBox(height: 8.0),
          if (imageUrls != null)
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE2F5FD),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: 246,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'What do you think?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
