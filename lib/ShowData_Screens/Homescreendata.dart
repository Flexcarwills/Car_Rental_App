import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowDataState();
  }
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('CarDeatils').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('loading');
        }
        final cardata = snapshot.data!.docs;
        return ListView.builder(
          itemCount: cardata.length,
          itemBuilder: (ctx, index) {
            final carname = cardata[index].data();
            return Text(carname['Car_Name']);
          },
        );
      },
    );
  }
}
