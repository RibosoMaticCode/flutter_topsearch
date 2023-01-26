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
  // bool showLogo = true;
  // bool showBack = true;
  // bool showClose = false;
  // int searchActionMin = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   FocusScope.of(context).unfocus();
      //   setState(() {
      //     showBack = true;
      //     showLogo = true;
      //   });
      // },
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
            title: const TitleSearchBar(),
            // title: LayoutBuilder(
            //   builder: (BuildContext context, BoxConstraints constraints) {
            //     return Container(
            //       padding: const EdgeInsets.only(right: 16.0),
            //       child: Flex(
            //         direction: Axis.horizontal,
            //         children: [
            //           (showLogo == true)
            //               ? Container(
            //                   // color: Colors.yellow,
            //                   child: Image.asset('assets/images/logotipo.png'))
            //               : Container(), // <-- SEE HERE
            //           Expanded(
            //             child: Container(
            //               margin: showLogo == false
            //                   ? const EdgeInsets.only(left: 20.0)
            //                   : null,
            //               decoration: const BoxDecoration(
            //                 color: Colors.white,
            //               ),
            //               child: Row(children: [
            //                 Expanded(
            //                   child: TextFormField(
            //                     onTap: () {
            //                       setState(() {
            //                         showLogo = false;
            //                         showBack = false;
            //                       });
            //                     },
            //                     controller: _controller,
            //                     decoration: InputDecoration(
            //                       border: InputBorder.none,
            //                       hintText: 'Busca lo que necesitas',
            //                       fillColor: Colors.white,
            //                       filled: true,
            //                       suffixIcon: () {
            //                         if (showClose == true) {
            //                           debugPrint('mostrar boton cerrar');
            //                           return IconButton(
            //                             iconSize: 24.0,
            //                             tooltip: 'Borrar',
            //                             padding: EdgeInsets.zero,
            //                             constraints: const BoxConstraints(),
            //                             icon: const Icon(
            //                               Icons.clear,
            //                             ),
            //                             onPressed: () {
            //                               setState(() {
            //                                 query = '';
            //                                 showClose = false;
            //                               });
            //                               _controller.clear();
            //                             },
            //                           );
            //                         }
            //                       }(),
            //                     ),
            //                     textAlignVertical: TextAlignVertical.center,
            //                     autofocus: false,
            //                     textInputAction: TextInputAction.search,
            //                     onChanged: (String newSearchValue) {
            //                       setState(() {
            //                         query = newSearchValue;

            //                         if (newSearchValue.length >=
            //                             searchActionMin) {
            //                           showClose = true;
            //                         } else {
            //                           showClose = false;
            //                         }
            //                       });
            //                     },
            //                     onFieldSubmitted: (String searchValue) {},
            //                   ),
            //                 ),
            //                 IconButton(
            //                   iconSize: 24.0,
            //                   color: Colors.grey,
            //                   tooltip: 'Lector QR',
            //                   padding: const EdgeInsets.only(left: 0.0),
            //                   constraints: const BoxConstraints(),
            //                   icon: const Icon(
            //                     Icons.qr_code_outlined,
            //                   ),
            //                   onPressed: () {},
            //                 ),
            //                 IconButton(
            //                   iconSize: 24.0,
            //                   color: Colors.grey,
            //                   tooltip: 'Buscar',
            //                   padding:
            //                       const EdgeInsets.symmetric(horizontal: 8.0),
            //                   constraints: const BoxConstraints(),
            //                   icon: const Icon(
            //                     Icons.search,
            //                   ),
            //                   onPressed: () {},
            //                 ),
            //               ]),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.orange,
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.blueGrey,
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.green,
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.purpleAccent,
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
