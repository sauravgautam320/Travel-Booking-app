// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late String _email, _password;

//   checkAuthentication() async {
//     _auth.authStateChanges().listen((user) async {
//       if (user != null) {
//         Navigator.pushReplacementNamed(context, '/HomeScreen');
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.checkAuthentication();
//   }

//   login() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       try {
//         UserCredential user = await _auth.signInWithEmailAndPassword(
//             email: _email, password: _password);
//       } catch (e) {
//         showError(e.message);
//       }
//     }
//   }

//   register() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       try {
//         UserCredential user = await _auth.createUserWithEmailAndPassword(
//             email: _email, password: _password);
//       } catch (e) {
//         showError(e.message);
//       }
//     }
//   }

//   showError(String errorMessage) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text(errorMessage),
//             actions: <Widget>[
//               ElevatedButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               )
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.yellow,
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 120,
//             ),
//             Container(
//               height: 200,
//               child: Image(
//                 image: AssetImage('assets/logo.png'),
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       validator: (input) {
//                         if (input!.isEmpty) return 'Enter Email';
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                       ),
//                       onSaved: (input) => _email = input!,
//                     ),
//                     TextFormField(
//                       validator: (input) {
//                         if (input!.length < 6)
//                           return 'Provide Minimum 6 Character Password';
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       obscureText: true,
//                       onSaved: (input) => _password = input!,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       onPressed: login,
//                       child: Text('Login', style: TextStyle(color: Colors.white)),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       onPressed: register,
//                       child: Text('Register', style: TextStyle(color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelveapp/register.dart';

import 'auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
            "assets/images/bg4.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(178, 172, 136, 0.4),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: h * 0.5,
              width: w * 0.8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Log In',
                    style: TextStyle(
                      color: Color.fromRGBO(178, 172, 136, 1),
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(178, 172, 136, 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(178, 172, 136, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color.fromRGBO(178, 172, 136, 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(178, 172, 136, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      const Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                AuthController authController = Get.find<AuthController>();
                authController.login(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(178, 172, 136, 1),
                ),
                child: const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: RichText(
                text: const TextSpan(
                  text: 'Dont have an account yet?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: ' Create',
                      style: TextStyle(
                        color: Color.fromRGBO(178, 172, 136, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              ),
            ),
          ]),
        ),
      ),],
    );
  }
}
