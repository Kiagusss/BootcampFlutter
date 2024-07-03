part of '../main.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  final List<String> names = [
    "John Doe",
    "Jane Smith",
    "Michael Brown",
    "Emily Davis",
    "Chris Johnson",
    "Jessica Wilson",
    "David Martinez",
    "Sarah Lee",
    "Daniel Walker",
    "Laura White"
  ];
  final List<bool> boolean = [
    true,
    true,
    true,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blue[200],
                    child: ClipOval(
                      child: Image.network(
                        "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue[200],
                      child: ClipOval(
                        child: Image.network(
                          "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue[200],
                      child: ClipOval(
                        child: Image.network(
                          "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Chats",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.add_circle_outline_outlined,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
          ],
          bottom: TabBar(
            indicatorColor: const Color(0xff2AABEE),
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    const Text(
                      "All Chats",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xff2AABEE),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "16",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Text(
                      "News",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xffe2f5fd),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "16",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Tab(text: 'Design'),
              const Tab(text: 'Midjournal'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 190,
                child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xff24A1DE),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade500,
                          radius: 30,
                          child: const CustomText(
                            text: "KA",
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Roboto",
                            color: Colors.white,
                          ),
                        ),
                        const CustomText(
                          text: "Kiagus Ahmad Farhan Aziz",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto",
                          color: Colors.white,
                        ),
                        const CustomText(
                          text: "+62 827 87423132",
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Roboto",
                          color: Colors.white,
                        ),
                      ],
                    )),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Profile',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.call,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Calls',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.map_outlined,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'People Nearby',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Saved Messages',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Settings',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(
                height: 20,
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_add,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Invite Friends',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  size: 30,
                ),
                title: const CustomText(
                  text: 'Telegram Features',
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xffB5E6FA),
            child: const Icon(
              Icons.add,
              color: Color(0xff165995),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: names.length,
              separatorBuilder: (context, index) => const Divider(
                height: 0.1,
                thickness: 1,
                color: Color(0xffE2F5FD),
              ),
              itemBuilder: (context, index) {
                bool noted = false;
                bool chated = false;
                bool readed = false;
                if (index == 0 || index == 1) {
                  noted = boolean[index];
                }
                if (index == 2 || index == 3 || index == 5) {
                  chated = boolean[index];
                }
                if (index == 4 || index == 8 || index == 6 || index == 7) {
                  readed = boolean[index];
                }
                return _chatWidget(
                  names[index],
                  null,
                  Text('Hello $index'),
                  noted: noted,
                  haveChat: chated,
                  readed: readed,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatDetailPage(username: names[index]),
                      ),
                    );
                  },
                );
              },
            ),
            const Center(child: Text('News')),
            const Center(child: Text('Design')),
            const Center(child: Text('Midjournal')),
          ],
        ),
      ),
    );
  }
}

Widget _chatWidget(String? name, String? image, Widget? chat,
    {bool noted = false,
    bool haveChat = false,
    bool readed = false,
    required VoidCallback onTap}) {
  Widget? trailingIcon;

  if (noted) {
    trailingIcon = const Icon(Icons.location_on);
    haveChat = false;
    readed = false;
  } else if (haveChat) {
    trailingIcon = const CircleAvatar(
      radius: 15,
      backgroundColor: Color(0xff2AABEE),
      child: CustomText(
        text: "2",
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
    noted = false;
    readed = false;
  } else if (readed) {
    trailingIcon = const Icon(Icons.check);
    noted = false;
    haveChat = false;
  } else {
    trailingIcon = null;
  }

  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 75,
      child: Center(
        child: ListTile(
          tileColor: noted ? const Color(0xffE2F5FD) : Colors.white,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image ??
                "https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg?auto=compress&cs=tinysrgb&w=600"),
          ),
          title: CustomText(text: name ?? "Kiagus"),
          subtitle: chat ?? Container(),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomText(text: "4:30 PM"),
              if (trailingIcon != null) trailingIcon,
            ],
          ),
        ),
      ),
    ),
  );
}
