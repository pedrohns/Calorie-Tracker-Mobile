import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import '../store/manage_state.dart';

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();

  final Function(String) onTextChanged;
  SearchTextField({required this.onTextChanged});
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final BehaviorSubject<String> _subject = BehaviorSubject<String>();

  @override
  void initState() {
    super.initState();

    // Escute as mudanças no _subject e adicione um delay (por exemplo, 500ms).
    // Após o delay, o valor mais recente é emitido.
    _subject.debounceTime(Duration(milliseconds: 600)).listen((text) {
      // Aqui é onde você deseja processar a entrada do usuário após o debouncing
      print("SearchTextField -  Processando: $text");
      widget.onTextChanged(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ManageState>(context);
    return TextField(
      controller: _controller,
      // Adicione o texto atual ao _subject cada vez que o usuário digitar.
      onChanged: (text) {
        setState(() {
          if (text == '') {
            controller.setLoad(false);
            controller.cancelSearch();
          }
          _subject.add(text);
        });
      },
      decoration: InputDecoration(
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                onPressed: () => setState(() {
                  _controller.clear();
                  controller.setLoad(false);
                  controller.cancelSearch();
                }),
                icon: Icon(Icons.close),
                color: Theme.of(context).colorScheme.secondary,
              )
            : null,
        contentPadding: EdgeInsets.all(10.0),
        labelText: 'Pesquisar por alimento',
        labelStyle: Theme.of(context).textTheme.titleSmall!,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _subject
        .close(); // Importante fechar o BehaviorSubject quando não for mais necessário
    super.dispose();
  }
}
