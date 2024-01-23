import 'package:calorie_tracker/view/configuration_page.dart';
import 'package:calorie_tracker/view/dairy_page.dart';
import 'package:calorie_tracker/view/home_page.dart';
import 'package:calorie_tracker/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/util_custom.dart';

class TabsScreen extends StatefulWidget {
  final int? selectedScreenIndex;
  const TabsScreen({Key? key, this.selectedScreenIndex}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? _screens;
  int _selectedScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedScreenIndex = widget.selectedScreenIndex ?? 0;
    _screens = [
      {
        'title': 'Calorie Tracker',
        'screen': const HomePage(),
      },
      {
        'title': 'Diário',
        'screen': const DairyPage(),
      },
      {
        'title': 'Configurações',
        'screen': const ConfigurationPage(),
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedScreenIndex]['title'] as String,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        leading: Image.asset(
          'assets/img/male_user.png', // caminho para o arquivo de imagem
          fit: BoxFit.contain,
          color: Colors.lightBlueAccent, // ajustar a imagem dentro do AppBar
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        color: Color.fromRGBO(18, 19, 29, 0.859),
        child: _screens![_selectedScreenIndex]['screen'] as Widget,
        height: double.infinity,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Painel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diário',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
