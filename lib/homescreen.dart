// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelveapp/auth_controller.dart';
import 'package:travelveapp/bookapackage.dart';
import 'package:travelveapp/chatpage.dart';
import 'package:travelveapp/findaccomodation.dart';
import 'package:travelveapp/privacypage.dart';
import 'package:travelveapp/upload.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg1.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(178, 172, 136, 0.2),
            centerTitle: true,
            title: const Text(
              'Travel+ve',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(178, 172, 136, 0.6),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookPackagePage()),
                    );
                  },
                  child: const Text('Book a Package'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(178, 172, 136, 0.6),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FindAccommodationPage()),
                    );
                  },
                  child: const Text('Find Accommodation'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg3.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(178, 172, 136, 0.2),
            centerTitle: true,
            title: const Text(
              'Travel+ve',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(178, 172, 136, 1),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: Text('Notifications/Messages'),
          )),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String email;

  const ProfilePage({Key? key, required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg3.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(178, 172, 136, 0.2),
            centerTitle: true,
            title: const Text(
              'Travel+ve',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(178, 172, 136, 0.4),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/user.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Welcome, ' + email,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: RichText(
                  text: const TextSpan(
                    text: 'Upload a file ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: ' Upload',
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
                  MaterialPageRoute(builder: (context) => UploadPage()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: RichText(
                  text: const TextSpan(
                    text: 'Our Privacy Policy ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: ' View',
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
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  AuthController authController = Get.find<AuthController>();
                  authController.logOut();
                },
                child: Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(178, 172, 136, 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({Key? key, required this.email}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(),
      InboxPage(),
      ProfilePage(email: widget.email),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        selectedItemColor: Color.fromRGBO(178, 172, 136, 1),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
