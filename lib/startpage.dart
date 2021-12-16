import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen.dart';



class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
  HomeScreen(),
    const Text(
      'EmptyScreen1',
      style: optionStyle,
    ),
    const Text(
      'EmptyScreen2',
      style: optionStyle,
    ),
     const Text(
      'EmptyScreen3',
      style: optionStyle,
    ),
     const Text(
      'EmptyScreen4',
      style: optionStyle,
    ),
  ];

void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'shopping bag',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'bookmark',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          iconSize: 30,
           type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xcc008c8c),
          unselectedItemColor: Colors.black12,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          
        ),
      ),
    );
  }
}