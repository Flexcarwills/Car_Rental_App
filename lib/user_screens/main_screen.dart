import 'package:car_rental_app/Home_Widgets/home_scree.dart';
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
      // body: myindex == 0
      //     ? HomeScreen()
      //     : myindex == 2
      //         ? Profile()
      //         : Center(child: Text('Rent Screen')),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex = index;
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (cyx) => widgetList[index]));
          // if (index == 0) {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (cyx) => HomeScreen()));
          // }
          // if (index == 1) {
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (cyx) => Center(child: Text('Rent Screen'))));
          // }
          // if (index == 2) {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (cyx) => Profile()));
          // }
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
