import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelveapp/auth_controller.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cardNoController = TextEditingController();
  TextEditingController _accountNoController = TextEditingController();
  TextEditingController _mpinController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(178, 172, 136, 1),
        title: Text('Booking Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.paypal),
                      Icon(Icons.payment),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _cardNoController,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid card number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = _formKey.currentState!.validate() &&
                          _cardNoController.text.isNotEmpty &&
                          _accountNoController.text.isNotEmpty &&
                          _mpinController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty;
                    });
                  },
                ),
                TextFormField(
                  controller: _accountNoController,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid account number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = _formKey.currentState!.validate() &&
                          _cardNoController.text.isNotEmpty &&
                          _accountNoController.text.isNotEmpty &&
                          _mpinController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty;
                    });
                  },
                ),
                TextFormField(
                  controller: _mpinController,
                  decoration: InputDecoration(
                    labelText: 'MPIN',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid MPIN';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = _formKey.currentState!.validate() &&
                          _cardNoController.text.isNotEmpty &&
                          _accountNoController.text.isNotEmpty &&
                          _mpinController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty;
                    });
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'AMOUNT',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid Amount';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _isButtonEnabled = _formKey.currentState!.validate() &&
                          _cardNoController.text.isNotEmpty &&
                          _accountNoController.text.isNotEmpty &&
                          _mpinController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty;
                    });
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(178, 172, 136, 1),
                  ),
                   onPressed: _isButtonEnabled
                      ? () async {
                          final email = AuthController.to.getEmail();
                          final paidAmount = int.parse(_priceController.text);
                          final bookingData = {
                            'email': email,
                            'paidAmount': paidAmount,
                          };
                          try {
                            await FirebaseFirestore.instance
                                .collection('bookings')
                                .add(bookingData);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Payment Successful!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _cardNoController.clear();
                                        _accountNoController.clear();
                                        _mpinController.clear();
                                        _priceController.clear();
                                        setState(() {
                                          _isButtonEnabled = false;
                                        });
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } catch (e) {
                            print('Error adding booking: $e');
                          }
                        }
                      : null,
                  child: Text('Pay Now!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}