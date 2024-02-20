import 'package:car_rental_app/Home_Widgets/attribute.dart';
import 'package:car_rental_app/Home_Widgets/car_details.dart';
import 'package:flutter/material.dart';

class RentalScreen extends StatefulWidget {
  const RentalScreen({
    super.key,
    required this.cardata,
  });

  final cardata;

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  @override
  Widget build(BuildContext context) {
    final _isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, _, __) => CarDetails(
                  title: widget.cardata['Car_Name'],
                  image: widget.cardata['Image_Url'],
                  carname: widget.cardata['Car_Name'],
                  carbrand: widget.cardata['Car_Brand'],
                  maxpower: widget.cardata['Max_Power'],
                  enginepower: widget.cardata['Engine_CC'],
                  topspeed: widget.cardata['Top_Speed'],
                  features: widget.cardata['Features'],
                  orgname: widget.cardata['Organization_Name'],
                  carrent: widget.cardata['Price'],
                ),
                transitionDuration: const Duration(milliseconds: 600),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  animation =
                      CurvedAnimation(curve: Curves.easeIn, parent: animation);

                  return SlideTransition(
                    position: Tween(
                            begin: const Offset(0, 0.10),
                            end: const Offset(0, 0))
                        .animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Stack(children: [
            Positioned(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(widget.cardata['Image_Url'][0],
                  width: double.infinity,
                  height: height <= 300
                      ? 60
                      : height > 300 && height <= 500
                          ? 120
                          : height > 500 && height <= 700
                              ? 190
                              : height > 700 && height <= 800
                                  ? 200
                                  : height > 800 && height <= 950
                                      ? 250
                                      : height > 950 && height <= 1100
                                          ? 350
                                          : 450,
                  fit: BoxFit.cover),
            )),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                // color: Colors.black45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20)),
                    color: _isDarkMode
                        ? Color.fromARGB(77, 145, 145, 145)
                        : Color.fromARGB(169, 0, 0, 0)),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u{20B9}' + widget.cardata['Price'],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cardata['Car_Color'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Attributes(
                            value: widget.cardata['Car_Name'], name: 'Brand'),
                        Attributes(
                            value: widget.cardata['Year'], name: 'Model Year'),
                        Attributes(
                            value: widget.cardata['Fuel_type'], name: 'Fuel'),
                        Attributes(
                            value: widget.cardata['Organization_Name'],
                            name: 'Company'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

/*class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.cardatalength,
      required this.orname,
      required this.carname,
      required this.carcolor,
      required this.transtype,
      required this.fueltype,
      required this.seatcapacity,
      required this.features,
      required this.price,
      required this.ownername,
      required this.phnnumber});
  final int? cardatalength;
  final String? orname;
  final String? carname;
  final String carcolor;
  final String transtype;
  final String fueltype;
  final String seatcapacity;
  final features;
  final String price;
  final String phnnumber;
  final String ownername;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text(orname ?? 'No Name')],
        ),
      ),
    );
  }
}*/
