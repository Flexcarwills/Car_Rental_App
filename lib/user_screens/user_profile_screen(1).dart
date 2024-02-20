import 'package:car_rental_app/components/textbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_rental_app/components/textbox.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentuser = FirebaseAuth.instance.currentUser!;
  final usercollection =
      FirebaseFirestore.instance.collection("Customer_Credentials");

  Future<void> editField(String field) async {
    String newvalue = " ";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                "Edit $field",
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Enter new $field",
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  newvalue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newvalue),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ));
    if (newvalue.trim().length > 0) {
      await usercollection.doc(currentuser.uid).update({field: newvalue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.grey[300],

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Customer_Credentials")
            .doc(currentuser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(children: [
              const SizedBox(
                height: 20,
              ),
              //user profile picture
              Icon(
                Icons.person,
                color: Colors.blueGrey[800],
                size: 52,
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
              mytextbox(
                text: userData['username'],
                sectionname: "User Name",
                onpressed: () => editField('username'),
              ),
              const SizedBox(
                height: 350,
              ),
              TextButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.logout),
                  label: Text("S I G N O U T"))
            ]);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
    //);
  }
}
