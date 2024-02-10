import 'package:car_rental_app/Home_Widgets/home_scree.dart';
import 'package:car_rental_app/ShowData_Screens/Homescreendata.dart';
import 'package:car_rental_app/user_screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  int myindex = 0;
  List<Widget> widgetList = const [
    HomeScreen(),
    Center(child: Text('Rent Screen')),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Flex Car')),
      ),
      body: IndexedStack(
        children: [widgetList[myindex]],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        currentIndex: myindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Rent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
