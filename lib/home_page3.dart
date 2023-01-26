import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_topsearch/searchbar.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  // String? query = ' ';
  // final _controller = TextEditingController();
  bool showLogoSearch = false;
  bool? showSuggestions;
  // bool showBack = true;
  // bool showClose = false;
  // int searchActionMin = 2;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notificationInfo) {
        if (notificationInfo is ScrollStartNotification) {
          print("scroll");
          print("detail:" + notificationInfo.dragDetails.toString());
          setState(() {
            showSuggestions = false;
          });

          /// your code
        }
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            leadingWidth: 30.0,
            // leading: (showBack == true)
            //     ? Container(
            //         color: Colors.redAccent,
            //         child: IconButton(
            //           // padding: EdgeInsets.zero,
            //           // constraints: const BoxConstraints(),
            //           iconSize: 24.0,
            //           icon: const Icon(
            //             Icons.arrow_back_ios,
            //           ),
            //           tooltip: 'Ir atras',
            //           onPressed: () {},
            //         ))
            //     : null,
            elevation: 0,
            titleSpacing: 0,
            title: TitleSearchBar(
              showLogo: showLogoSearch,
              showSuggestions: showSuggestions,
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.orange,
                  child: const Text(
                    "A",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.blueGrey,
                  child: const Text(
                    "B",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.green,
                  child: const Text(
                    "C",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.yellow,
                  child: const Text(
                    "D",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.purpleAccent,
                  child: const Text(
                    "E",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),
          )),
    );
  }

  doSearch() {
    return 'Hola Mundo';
  }
}
