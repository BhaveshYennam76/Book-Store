import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Core/Constants/Colors.dart';
import '../../Core/Widgets/Custom_Text.dart';
import '../../Core/Widgets/Custom_Button.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> images = [
    'assets/images/neet1.jpg',
    'assets/images/neet2.png',
    'assets/images/neet3.jpg',
    'assets/images/neet4.jpg',
    'assets/images/neet5.jpg',
  ];

  double totalPrice = 0.0;
  double gst = 0.0;
  double my = 0.0;

  late StreamSubscription<QuerySnapshot> _subscription;

  @override
  void initState() {
    super.initState();

    // Listen to Firestore changes
    _subscription = FirebaseFirestore.instance
        .collection('Orders')
        .snapshots()
        .listen((snapshot) {
          double newTotalPrice = 0.0;
          for (var item in snapshot.docs) {
            newTotalPrice += item['price'] ?? 0.0;
          }

          // Update totalPrice if it's different
          if (newTotalPrice != totalPrice) {
            setState(() {
              totalPrice = newTotalPrice;
              gst = totalPrice * 8 / 100;
              my = totalPrice + gst;
            });
          }
        });
  }

  @override
  void dispose() {
    // Cancel the subscription to avoid memory leaks
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _removeItem(String orderId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(orderId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Item deleted successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Item deleted successfully');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error'), duration: Duration(seconds: 2)),
      );
      print('Error deleting item: $e');
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> books = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: customText(
          label: "Cart",
          colour: AppColors.darkblue,
          weight: FontWeight.bold,
          fontsize: 24,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/nobooks.jpg",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const Text(
                    'No Books found !',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.white,
                elevation: 1,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            snapshot.data!.docs[index]['name'] ==
                                    "NCERT Physics"
                                ? images[0]
                                : snapshot.data!.docs[index]['name'] ==
                                    "NCERT Chemistry"
                                ? images[1]
                                : snapshot.data!.docs[index]['name'] ==
                                    "NCERT Biology"
                                ? images[2]
                                : snapshot.data!.docs[index]['name'] ==
                                    "Concepts of Physics"
                                ? images[3]
                                : images[4],
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          customText(
                            label: snapshot.data!.docs[index]['name'],
                            colour: AppColors.darkblue,
                            weight: FontWeight.bold,
                            fontsize: 16,
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "-35%",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "M.R.P.: ₹999",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 0.5,
                                ),
                              ),
                              const SizedBox(width: 10),
                              customText(
                                label:
                                    '₹' +
                                    snapshot.data!.docs[index]['price']
                                        .toString(),
                                colour: AppColors.darkblue,
                                weight: FontWeight.w700,
                                fontsize: 14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: customButtonWhiteText(
                              label: 'remove',
                              colour: Colors.red,
                              onPressed:
                                  () => _removeItem(
                                    snapshot.data!.docs[index]['id'],
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    label: "Price",
                    colour: AppColors.lightblack,
                    fontsize: 14,
                    weight: FontWeight.w600,
                  ),
                  customText(
                    label: '₹' + totalPrice.toString(),
                    colour: AppColors.textColor,
                    fontsize: 14,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    label: "Taxation(8%) Incl.",
                    colour: AppColors.lightblack,
                    fontsize: 14,
                    weight: FontWeight.w600,
                  ),
                  customText(
                    label: '₹' + gst.toString(),
                    colour: AppColors.textColor,
                    fontsize: 14,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    label: "Total payable",
                    colour: AppColors.lightblack,
                    fontsize: 14,
                    weight: FontWeight.w600,
                  ),
                  customText(
                    label: '₹' + my.toString(),
                    colour: AppColors.textColor,
                    fontsize: 14,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  customButtonWhiteText(
                    label: "Pay Now",
                    colour: Colors.orange,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
