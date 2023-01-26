import 'package:flutter/material.dart';

class TitleSearchBar extends StatefulWidget {
  const TitleSearchBar({super.key});

  @override
  State<TitleSearchBar> createState() => _TitleSearchBarState();
}

class _TitleSearchBarState extends State<TitleSearchBar> {
  String? query = ' ';
  final focusNode = FocusNode();
  final _controller = TextEditingController();
  OverlayEntry? entry;
  bool showLogo = true;
  bool showBack = true;
  bool showClose = false;
  int searchLengthMin = 2;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());

    focusNode.addListener(() {
      // if (focusNode.hasFocus) {
      //   showOverlay();
      // } else {
      //   hideOverlay();
      // }
    });
  }

  @override
  void dispose() {
    hideOverlay();
    super.dispose();
  }

  void showOverlay() {
    if (entry != null) {
      entry?.remove();
      entry = null;
    }

    debugPrint('mostrar overlay');
    final OverlayState? overlayState = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx + 20,
            top: offset.dy + size.height,
            width: size.width - 40,
            child: suggestionList()));
    overlayState?.insert(entry!);
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => overlayState?.insert(entry!));
  }

  void hideOverlay() {
    debugPrint('ocultar overlay');
    entry?.remove();
    entry = null;
  }

  void stateValue(String value) {
    setState(() {
      query = value;
      if (query!.length >= searchLengthMin) {
        showOverlay();
        // WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
        // WidgetsBinding.instance.addPostFrameCallback((_) => overlayState.insert(overlayEntry));
      } else {
        hideOverlay();
      }
    });
  }

  Widget suggestionList() => Material(
        elevation: 8,
        child: Column(children: [
          const ListTile(title: Text('Zapatillas adidas')),
          ListTile(
            title: const Text('Zapatillas nike'),
            onTap: () {
              _controller.text = "Zapatillas nike";
              hideOverlay();
              focusNode.unfocus();
            },
          ),
          const ListTile(
            title: Text('Zapatillas puma'),
          ),
          const ListTile(
            title: Text('Zapatillas sckechers'),
          ),
          const ListTile(
            title: Text('Zapatillas tigre'),
          ),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {

    return Container(
      padding: const EdgeInsets.only(right: 16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          (showLogo == true)
              ? Container(
                  // color: Colors.yellow,
                  child: Image.asset('assets/images/logotipo.png'))
              : Container(), // <-- SEE HERE
          Expanded(
            child: Container(
              margin:
                  showLogo == false ? const EdgeInsets.only(left: 20.0) : null,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      setState(() {
                        showLogo = false;
                        showBack = false;
                      });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Busca lo que necesitas',
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: () {
                        if (showClose == true) {
                          return IconButton(
                            iconSize: 24.0,
                            tooltip: 'Borrar',
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(
                              Icons.clear,
                            ),
                            onPressed: () {
                              setState(() {
                                query = '';
                                showClose = false;
                              });
                              _controller.clear();
                              hideOverlay();
                            },
                          );
                        }
                      }(),
                    ),
                    // suffixIcon: IconButton(
                    //   iconSize: 24.0,
                    //   tooltip: 'Borrar',
                    //   padding: EdgeInsets.zero,
                    //   constraints: const BoxConstraints(),
                    //   icon: const Icon(
                    //     Icons.clear,
                    //   ),
                    //   onPressed: () {
                    //     setState(() {
                    //       query = '';
                    //       showClose = false;
                    //     });
                    //     _controller.clear();
                    //     hideOverlay();
                    //   },
                    // )),
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: false,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    onChanged: (String searchValue) {
                      setState(() {
                        query = searchValue;

                        if (searchValue.length >= searchLengthMin) {
                          showClose = true;
                        } else {
                          showClose = false;
                        }
                      });
                      if (query!.length >= searchLengthMin) {
                        showOverlay();
                      } else {
                        hideOverlay();
                      }

                      // stateValue(searchValue);
                    },
                    onFieldSubmitted: (String searchValue) {},
                  ),
                ),
                IconButton(
                  iconSize: 24.0,
                  color: Colors.grey,
                  tooltip: 'Lector QR',
                  padding: const EdgeInsets.only(left: 0.0),
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.qr_code_outlined,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 24.0,
                  color: Colors.grey,
                  tooltip: 'Buscar',
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
              ]),
            ),
          ),
        ],
      ),
    );

    //   },
    // );
  }
}
