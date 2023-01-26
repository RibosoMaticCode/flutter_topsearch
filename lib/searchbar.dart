import 'package:flutter/material.dart';

class TitleSearchBar extends StatefulWidget {
  final Function? updateButtons;
  final bool? showLogo;
  bool? showSuggestions;
  // const TitleSearchBar({super.key});
  TitleSearchBar(
      {Key? key, this.updateButtons, this.showLogo, this.showSuggestions})
      : super(key: key);

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
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
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
    // if (widget.showSuggestions == false) hideOverlay();

    return Container(
      padding: const EdgeInsets.only(right: 16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          (widget.showLogo == true || showLogo == true)
              ? Container(
                  color: Colors.yellow,
                  child: Image.asset('assets/images/logotipo.png'))
              : Container(), // <-- SEE HERE
          Expanded(
            child: Container(
              margin: (widget.showLogo == false || showLogo == false)
                  ? const EdgeInsets.only(left: 20.0)
                  : null,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      activeSearch();
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
                              emptySearch();
                            },
                          );
                        }
                      }(),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: false,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    onChanged: (String searchValue) {
                      setState(() {
                        query = searchValue;
                      });
                      showSuggestions();
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
  }

  void activeSearch() {
    // ocultar back, logo
    setState(() {
      showBack = false;
      showLogo = false;
    });
    showSuggestions();
  }

  void showSuggestions() {
    if (query!.length >= searchLengthMin) {
      setState(() {
        showClose = true;
      });
      showOverlay();
    } else {
      setState(() {
        showClose = false;
      });
      hideOverlay();
    }
  }

  void deactiveSearch() {
    // mostrar back, logo
    setState(() {
      showBack = true;
      showLogo = true;
    });

    // ocultar sugerencias
    hideOverlay();
  }

  void emptySearch() {
    // borrar inputtext
    // ocultar boton close
    _controller.clear();
    setState(() {
      query = '';
      showClose = false;
    });

    // ocultar sugerencias
    hideOverlay();
  }
}
