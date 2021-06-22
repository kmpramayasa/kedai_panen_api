import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/product_screen.dart';
import '../screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Class BottomNavigation sebagai routing controller
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  //Variabel
  int _currentIndex = 0; //Sebagai penanda page yang sedang aktif

  //List widget untuk menyimpan data class masing-masing halaman
  final List <Widget> _page = [
    HomeScreen(),
    ProductScreen(),
    ProfileScreen()
  ];

  //Method yang dijalankan ketika item navigation ditekan
  void _navigationTapped(int index){
    setState(() {
      _currentIndex = index; //mempassing nilai parameter index ke dalam variabel current index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_currentIndex], //memanggil list widget

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF389048),
        selectedFontSize: 12,
        unselectedFontSize: 12, 
        iconSize: 16,

        //naigation item        
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Beranda',            
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.shoppingBasket),
            label: 'Produk'
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            label: 'Profil'
          ),
        ],

        currentIndex: _currentIndex, //halaman yang sedang aktif
        onTap: _navigationTapped, //ketika terjadi tap maka akan dijalanan method _navigationTapped

      ),
    );
  }
}