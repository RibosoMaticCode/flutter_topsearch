import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const Text('Kindacode.com'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'This is an awesome shopping platform',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.pink,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
