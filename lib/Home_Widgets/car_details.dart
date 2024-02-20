import 'package:car_rental_app/Home_Widgets/images_display.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({
    super.key,
    required this.title,
    required this.image,
    required this.carname,
    required this.carbrand,
    required this.maxpower,
    required this.enginepower,
    required this.topspeed,
    required this.features,
    required this.orgname,
    required this.carrent,
  });

  final title;
  final orgname;
  final List image;
  final carrent;
  final carname;
  final carbrand;
  final maxpower;
  final topspeed;
  final enginepower;
  final List features;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

// final firestore2 =
//     FirebaseFirestore.instanceFor(app: Firebase.app('project-2'));

// final firebase = firestore2.collection('CarDeatils').snapshots();

class _CarDetailsState extends State<CarDetails> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  List<Widget> builPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.image.length; i++) {
      list.add(builIndicator(i == currentIndex));
    }
    return list;
  }

  // Builded A dot indicator to show which images is on the user is.
  Widget builIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).colorScheme.secondary : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget buildGridFeatures() {
    return ListView.builder(
        itemCount: widget.features.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: const FaIcon(FontAwesomeIcons.solidCircle),
            title: Text(widget.features[index].toString()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    print(width);

    double height = MediaQuery.of(context).size.height;
    print(height);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isDarkMode
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary,
        title: Text(
          widget.carbrand + ' ' + widget.title,
          style: TextStyle(color: _isDarkMode ? Colors.black : Colors.white),
        ),
        iconTheme: _isDarkMode
            ? const IconThemeData(color: Colors.black)
            : const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.shareNodes)),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.heart))
        ],
      ),
      body: SingleChildScrollView(
        physics: RangeMaintainingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 10),
              child: Text(
                widget.title,
                style: GoogleFonts.libreFranklin(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: _isDarkMode ? Colors.white : Colors.black)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text(
                widget.carbrand,
                style: GoogleFonts.rubik(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: _isDarkMode ? Colors.white : Colors.black)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height / 4,
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(20),
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (number) {
                      setState(() {
                        currentIndex = number;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.image.length,
                    itemBuilder: (ctx, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.image[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: builPageIndicator()),
            ),
            const SizedBox(
              height: 5,
            ),
            // const Divider(
            //   color: Colors.blueGrey,
            //   indent: 10,
            //   endIndent: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15.0, bottom: 20),
              child: Text(
                '\u{20B9}' + widget.carrent + '/day',
                style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: _isDarkMode ? Colors.white : Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15.0, bottom: 20),
              child: Text(
                'Specifications',
                style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: _isDarkMode ? Colors.white : Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 110,
                    width: width <= 360
                        ? 80
                        : width > 360 && width <= 420
                            ? 110
                            : width > 420 && width <= 600
                                ? 150
                                : 190,
                    // padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDarkMode
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondaryContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1.0),
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      //border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Top Speed',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: _isDarkMode
                                        ? Theme.of(context)
                                            .colorScheme
                                            .primaryContainer
                                        : Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.topspeed + ' KM/H',
                          style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 15,
                                      color: _isDarkMode
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      fontWeight: FontWeight.w800)),
                        ),
                        // Text(carpower),
                        // Text(carEngine),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: width <= 360
                        ? 80
                        : width > 360 && width <= 430
                            ? 110
                            : width > 430 && width <= 600
                                ? 150
                                : 190,
                    // padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDarkMode
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1.0),
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                        ),
                      ],
                      //border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Engine',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 20,
                                    color: _isDarkMode
                                        ? Theme.of(context)
                                            .colorScheme
                                            .primaryContainer
                                        : Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.enginepower + ' CC',
                          style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 15,
                                      color: _isDarkMode
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      fontWeight: FontWeight.w800)),
                        ),
                        // Text(carpower),
                        // Text(carEngine),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: width <= 360
                        ? 80
                        : width > 360 && width <= 430
                            ? 110
                            : width > 430 && width <= 600
                                ? 150
                                : 190,
                    // padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDarkMode
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      // border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1.0),
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Max Power',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontSize: 17,
                                  color: _isDarkMode
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primaryContainer
                                      : Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.maxpower + ' HP',
                          style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 16,
                                      color: _isDarkMode
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                      fontWeight: FontWeight.w800)),
                        ),
                        // Text(carpower),
                        // Text(carEngine),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15.0, bottom: 20),
              child: Text(
                'Features',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: _isDarkMode ? Colors.white : Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.blueAccent)),
                    child: buildGridFeatures()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15.0, bottom: 20),
              child: Text(
                'Renter',
                style: GoogleFonts.montserrat(
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: _isDarkMode ? Colors.white : Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 30, bottom: 100),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    widget.orgname,
                    style: GoogleFonts.lato(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 20,
                                color: _isDarkMode ? Colors.white : Colors.grey,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: TextButton(
          onPressed: () {
            // Navigator.pushReplacement(
            //     context,
            //     PageRouteBuilder(
            //         pageBuilder: (context, _, __) => const AuthencationScreen(),
            //         transitionDuration: const Duration(seconds: 2),
            //         transitionsBuilder:
            //             (context, animation, anotherAnimation, child) {
            //           animation = CurvedAnimation(
            //               curve: Curves.decelerate, parent: animation);

            //           return SlideTransition(
            //             position: Tween(
            //               begin: const Offset(0, 0.3),
            //               end: const Offset(0, 0),
            //             ).animate(animation),
            //             child: child,
            //           );
            //         }));
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: const Size.fromHeight(80),
          ),
          child: Text(
            'Book Now',
            style: //isdark
                //? Theme.of(context).textTheme.headline4
                Theme.of(context).textTheme.headline4,
          )),
    );
  }
}
