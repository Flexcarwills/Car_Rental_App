import 'package:car_rental_app/Authentication_Screens/sigin.dart';
import 'package:car_rental_app/user_screens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthencationScreen extends StatefulWidget {
  const AuthencationScreen({super.key});

  @override
  State<AuthencationScreen> createState() => _AuthencationScreenState();
}

final _firebase = FirebaseAuth.instance;

class _AuthencationScreenState extends State<AuthencationScreen> {
  final formkey = GlobalKey<FormState>();
  var _email = '';
  var pass = '';
  var _username = '';
  var _islogin = true;
  var _isUploading = false;
  Future<void> Savedata() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // setState(() {
    //   _islogin = !_islogin;
    // });
    formkey.currentState!.save();
    try {
      setState(() {
        _isUploading = true;
      });
      if (_islogin) {
        final customerCredentials = await _firebase.signInWithEmailAndPassword(
            email: _email, password: pass);
      } else {
        final customerCredentials = await _firebase
            .createUserWithEmailAndPassword(email: _email, password: pass);

        // Sending and creating the collection on firebase fireStore that is the remote ot cloud database
        await FirebaseFirestore.instance
            .collection('Customer_Credentials')
            .doc(customerCredentials.user!.uid)
            .set({
          'username': _username,
          'email': _email,
          'password': pass,
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => main_screen()))
        });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => mainscreen()));
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed'),
        ),
      );
    }
    setState(() {
      _isUploading = false;
      _islogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? Theme.of(context).colorScheme.background : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: isDark
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(90),
                    bottomEnd: Radius.circular(90)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _islogin
                      ? const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Showing the Greeting message.
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 16,
                            color: isDark
                                ? Colors.white
                                : Theme.of(context).colorScheme.secondary,
                          ),
                    ),

                    Card(
                      elevation: 10,
                      shadowColor: Colors.grey,
                      color: isDark
                          ? Theme.of(context).colorScheme.onBackground
                          : Theme.of(context).colorScheme.background,
                      margin: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    label: Text(
                                      'Email Address',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    //errorStyle: TextStyle(color: Colors.red),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderSide:
                                    //         BorderSide(color: Colors.grey.shade300)),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  //cursorColor: Colors.black,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please Enter the valid Email Address';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _email = value!;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                if (!_islogin)
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Username',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                    enableSuggestions: false,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.trim().length < 2) {
                                        return 'Please Enter the valid username atleast 4 characters';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _username = value!;
                                    },
                                  ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.black),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderSide:
                                    //         BorderSide(color: Colors.grey.shade300)),
                                    //errorStyle: TextStyle(color: Colors.red),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Password Must be atleast 8 characters long';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    pass = value!;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: isDark
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Created the Elevated button for Login and Sign up Based the State where it is login or Register.
                    ElevatedButton(
                      onPressed: Savedata,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                      child: Text(
                        _islogin ? 'Login' : 'Signup',
                        style: TextStyle(
                          color: isDark
                              ? Colors.black
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Created a Filled Button For showing user wheather they want to login or Signup
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            _islogin = !_islogin;
                          });
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: isDark
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(_islogin
                            ? 'Create an account'
                            : 'Already have an account')),

                    const SizedBox(
                      height: 15,
                    ),
                    // or continue With

                    if (!_islogin)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Created the Icon Button for Google Sign in AND Apple Signin only visible if the user is Registering themsevelses.
                    if (!_islogin)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.outlined(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              size: 50,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.green),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          IconButton.outlined(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.apple,
                              size: 50,
                            ),
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor:
                                    isDark ? Colors.white : Colors.black),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
