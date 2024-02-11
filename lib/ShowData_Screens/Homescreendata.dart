import 'package:car_rental_app/Home_Widgets/home_scree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final firestore1 =
    FirebaseFirestore.instanceFor(app: Firebase.app('project-1'));
final firestore2 =
    FirebaseFirestore.instanceFor(app: Firebase.app('project-2'));

class ShowData extends StatefulWidget {
  const ShowData({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ShowDataState();
  }
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore2.collection('CarDeatils').snapshots(),
      builder: (context, cardatasnapshot) {
        if (cardatasnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!cardatasnapshot.hasData || cardatasnapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No Cars Found'));
        }
        if (cardatasnapshot.hasError) {
          return const Center(
            child: Text('Something went Wrong...'),
          );
        }
        final cardata = cardatasnapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          itemCount: cardata.length,
          itemBuilder: (ctx, index) {
            final carname = cardata[index].data();
            return HomeScreen(carname: carname['Car_Name']);
          },
        );
      },
    );
  }
}
