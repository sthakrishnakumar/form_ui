import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Feed',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.photo_camera_outlined,
          color: Color(0xffF74F70),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xffF74F70),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.more_horiz_outlined,
                  color: Color(0xffF74F70),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CircleAvatar(
              backgroundColor: Color(0xffF74F70),
              maxRadius: 29,
              child: CircleAvatar(
                maxRadius: 27,
              ),
            ),
          )
        ],
      ),
    );
  }
}
