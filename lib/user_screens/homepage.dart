import 'package:car_rental_app/ShowData_Screens/Homescreendata.dart';
import 'package:car_rental_app/user_screens/user_profile_screen(1).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final _isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isDarkMode
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary,
        toolbarHeight: 80.0,
        //backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Flex Wheels',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: _isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: _isDarkMode ? Colors.black : Colors.white,
              )),
          // IconButton(
          //     onPressed: () {
          //       FirebaseAuth.instance.signOut();
          //     },
          //     icon: const Icon(
          //       Icons.logout,
          //       color: Colors.white,
          //     )),
        ],
        iconTheme: _isDarkMode
            ? const IconThemeData(color: Colors.black)
            : const IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      drawer: const NavigationBar(),
      body: Center(),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final _isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    print(width);

    double height = MediaQuery.of(context).size.height;
    print(height);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
            Align(
              heightFactor: height <= 300
                  ? 1
                  : height > 300 && height <= 500
                      ? 2
                      : height > 500 && height <= 700
                          ? 3
                          : height > 700 && height <= 800
                              ? 4
                              : height > 800 && height <= 950
                                  ? 5
                                  : height > 950 && height <= 1100
                                      ? 6
                                      : 7,
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shadowColor: _isDarkMode
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    animationDuration: const Duration(seconds: 2),
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: Text(
                  'S I G N O U T',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const Profile()));
      },
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 24, left: 20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(
                  'https://cdn.wallpapersafari.com/58/77/xB37fF.jpg'),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'Veer',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 25,

                    //color: Colors.black,
                  ),
            ),
            const SizedBox(width: 50),
            FaIcon(FontAwesomeIcons.circleChevronRight,
                color: Theme.of(context).colorScheme.onPrimary),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 10),
      child: Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined,
                size: width <= 360
                    ? 30
                    : width > 360 && width <= 420
                        ? 35
                        : width > 420 && width <= 600
                            ? 40
                            : 46,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width <= 360
                      ? 14
                      : width > 360 && width <= 420
                          ? 20
                          : width > 420 && width <= 600
                              ? 30
                              : 35,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.car_rental,
                size: width <= 360
                    ? 30
                    : width > 360 && width <= 420
                        ? 35
                        : width > 420 && width <= 600
                            ? 40
                            : 46,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Rentals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width <= 360
                      ? 14
                      : width > 360 && width <= 420
                          ? 20
                          : width > 420 && width <= 600
                              ? 30
                              : 35,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => const ShowData(),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder:
                          (context, animation, anotherAnimation, child) {
                        animation = CurvedAnimation(
                            curve: Curves.easeIn, parent: animation);

                        return SlideTransition(
                          // scale: animation,
                          position: Tween(
                                  begin: const Offset(-1, 0), end: Offset.zero)
                              .animate(animation),
                          child: child,
                        );
                      }));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,
                size: width <= 360
                    ? 30
                    : width > 360 && width <= 420
                        ? 35
                        : width > 420 && width <= 600
                            ? 40
                            : 46,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Favourites',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width <= 360
                      ? 14
                      : width > 360 && width <= 420
                          ? 20
                          : width > 420 && width <= 600
                              ? 30
                              : 35,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications,
                size: width <= 360
                    ? 30
                    : width > 360 && width <= 420
                        ? 35
                        : width > 420 && width <= 600
                            ? 40
                            : 46,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width <= 360
                      ? 14
                      : width > 360 && width <= 420
                          ? 20
                          : width > 420 && width <= 600
                              ? 30
                              : 35,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings,
                size: width <= 360
                    ? 30
                    : width > 360 && width <= 420
                        ? 35
                        : width > 420 && width <= 600
                            ? 40
                            : 46,
                color: Theme.of(context).colorScheme.onBackground),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: width <= 360
                      ? 14
                      : width > 360 && width <= 420
                          ? 20
                          : width > 420 && width <= 600
                              ? 30
                              : 35,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
