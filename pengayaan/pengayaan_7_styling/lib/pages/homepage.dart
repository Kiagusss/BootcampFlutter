import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String username;

  const Homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.notifications,
                  size: 35,
                ),
                Icon(
                  Icons.shopify,
                  size: 35,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: const Text(
                "Welcome,",
                style: TextStyle(
                  color: Color(0xff5ec8f8),
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              child: Text(
                username,
                style: const TextStyle(
                  color: Color(0xff1363a2),
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xff2E6EEF),
                  ),
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Recomended Place",
              style: TextStyle(
                color: Color(0xff454545),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                ImageReused(
                  image:
                      "https://th.bing.com/th?id=OIP.6I13eiNuRdYR1tPYMRb_6wHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                ),
                SizedBox(
                  width: 11,
                ),
                ImageReused(
                  image:
                      "https://th.bing.com/th?id=OIP.6I13eiNuRdYR1tPYMRb_6wHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                ImageReused(
                  image:
                      "https://th.bing.com/th?id=OIP.6I13eiNuRdYR1tPYMRb_6wHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                ),
                SizedBox(
                  width: 11,
                ),
                ImageReused(
                  image:
                      "https://th.bing.com/th?id=OIP.6I13eiNuRdYR1tPYMRb_6wHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageReused extends StatelessWidget {
  final String? image;

  const ImageReused({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
              width: 10,
            )),
        child: Image.network(image.toString()));
  }
}
