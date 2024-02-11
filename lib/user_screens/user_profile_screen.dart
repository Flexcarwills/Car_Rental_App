import 'package:car_rental_app/components/textbox.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            "Profile Screen",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.grey[300],

      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          //user profile picture
          Icon(
            Icons.person,
            color: Colors.blueGrey,
            size: 72,
          ),
          SizedBox(height: 10),
          //user email
          Text(
            currentuser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),
          SizedBox(
            height: 50,
          ),

          //user details
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'My Details',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          mytextbox(text: currentuser.uid, sectionname: "User Name")
          //signout button
        ],
      ),
    );
    //);
  }
}
