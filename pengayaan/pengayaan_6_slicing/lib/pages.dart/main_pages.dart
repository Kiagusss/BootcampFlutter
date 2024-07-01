import 'package:flutter/material.dart';
import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:pengayaan_6_slicing/pages.dart/chat_room.dart';

class MainPages extends StatelessWidget {
  const MainPages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'name': 'Upin Ipin',
        'text': 'Nak Ayam Goyeng',
        'image':
            'https://i.pinimg.com/564x/a0/bd/0e/a0bd0e9d3f8308400d23a9e247589fa5.jpg',
      },
      {
        'name': 'Opah',
        'text': 'Jangan Macemtu Ros',
        'image':
            'https://i.pinimg.com/236x/dd/c5/f6/ddc5f675fe1ca57391a9e2851f348255.jpg',
      },
      {
        'name': 'Kak Ros',
        'text': 'UPIN IPIN MAKANN',
        'image':
            'https://i.pinimg.com/236x/a3/84/81/a38481bd99bb3e784b692aaf07e51671.jpg',
      },
      {
        'name': 'Upin Ipin',
        'text': 'Nak Ayam Goyeng',
        'image':
            'https://i.pinimg.com/564x/a0/bd/0e/a0bd0e9d3f8308400d23a9e247589fa5.jpg',
      },
      {
        'name': 'Opah',
        'text': 'Jangan Macemtu Ros',
        'image':
            'https://i.pinimg.com/236x/dd/c5/f6/ddc5f675fe1ca57391a9e2851f348255.jpg',
      },
      {
        'name': 'Kak Ros',
        'text': 'UPIN IPIN MAKANN',
        'image':
            'https://i.pinimg.com/236x/a3/84/81/a38481bd99bb3e784b692aaf07e51671.jpg',
      },
      {
        'name': 'Upin Ipin',
        'text': 'Nak Ayam Goyeng',
        'image':
            'https://i.pinimg.com/564x/a0/bd/0e/a0bd0e9d3f8308400d23a9e247589fa5.jpg',
      },
      {
        'name': 'Opah',
        'text': 'Jangan Macemtu Ros',
        'image':
            'https://i.pinimg.com/236x/dd/c5/f6/ddc5f675fe1ca57391a9e2851f348255.jpg',
      },
      {
        'name': 'Kak Ros',
        'text': 'UPIN IPIN MAKANN',
        'image':
            'https://i.pinimg.com/236x/a3/84/81/a38481bd99bb3e784b692aaf07e51671.jpg',
      },
      {
        'name': 'Upin Ipin',
        'text': 'Nak Ayam Goyeng',
        'image':
            'https://i.pinimg.com/564x/a0/bd/0e/a0bd0e9d3f8308400d23a9e247589fa5.jpg',
      },
      {
        'name': 'Opah',
        'text': 'Jangan Macemtu Ros',
        'image':
            'https://i.pinimg.com/236x/dd/c5/f6/ddc5f675fe1ca57391a9e2851f348255.jpg',
      },
      {
        'name': 'Kak Ros',
        'text': 'UPIN IPIN MAKANN',
        'image':
            'https://i.pinimg.com/236x/a3/84/81/a38481bd99bb3e784b692aaf07e51671.jpg',
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "WhatsApp",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        openPage(const ChatRoom(), context);
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(items[index]['image']!),
                              radius: 30,
                            ),
                            title: Text(items[index]['name']!),
                            subtitle: Text(items[index]['text']!),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: double.infinity,
          //     color: Colors.white,
          //     height: 80,
          //     child: const Row(),
          //   ),
          // )
        ],
      ),
    );
  }
}
