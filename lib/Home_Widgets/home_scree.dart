import 'package:car_rental_app/Home_Widgets/attribute.dart';
import 'package:car_rental_app/Home_Widgets/car_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.cardata,
  });

  final cardata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => CarDeatisl()));
          },
          child: Stack(children: [
            Positioned(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(cardata['Image_Url'][0],
                  width: double.infinity, height: 300, fit: BoxFit.cover),
            )),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                // color: Colors.black45,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20)),
                    color: Colors.black45),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u{20B9}' + cardata['Price'],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cardata['Car_Color'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Attributes(value: cardata['Car_Name'], name: 'Brand'),
                        Attributes(value: cardata['Year'], name: 'Model Year'),
                        Attributes(value: cardata['Fuel_type'], name: 'Fuel'),
                        Attributes(
                            value: cardata['Organization_Name'],
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
