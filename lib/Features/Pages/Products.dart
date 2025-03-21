import 'package:flutter/material.dart';
import 'package:spotify_library/Core/Widgets/Custom_Button.dart';
import 'package:uuid/uuid.dart';
import '../../Core/Constants/Colors.dart';
import '../../Core/Widgets/Custom_Text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void showBookDetails(int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (builder) {
        String detailMessage;
        switch (indexe) {
          case 0:
            detailMessage =
                "NCERT Physics Class 11 & 12 introduces core topics like mechanics, thermodynamics, electromagnetism, and optics with clear explanations and illustrative examples, building a strong foundation for both school and competitive exams.";
            break;
          case 1:
            detailMessage =
                "NCERT Chemistry Class 11 & 12 covers essential topics in physical, organic, and inorganic chemistry with clear explanations and illustrative examples, building a solid foundation for school studies and competitive exams.";
            break;
          case 2:
            detailMessage =
                "NCERT Biology Class 11 & 12 covers essential topics including cell biology, genetics, physiology, evolution, and ecology with clear explanations and illustrative diagrams, creating a solid foundation for both school studies and competitive exams.";
            break;
          case 3:
            detailMessage =
                "Concepts of Physics covers fundamental topics including mechanics, electricity, magnetism, and modern physics with clear explanations and practical problems, building a robust foundation for competitive exams.";
            break;
          case 4:
            detailMessage =
                "Concepts of Physics covers fundamental topics including mechanics, electricity, magnetism, and modern physics with clear explanations and practical problems, building a robust foundation for competitive exams.";
            break;
          default:
            detailMessage =
                "Objective Physics offers a concise review of key physics concepts paired with a broad range of objective-type questions and solved examples, effectively reinforcing theory and sharpening problem-solving skills for exam preparation.";
        }
        return Container(
          height: MediaQuery.of(context).size.height*0.5,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 14.0,
                  bottom: 15,
                  left: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    images[index],
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                names[indexe],
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.darkblue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
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
                    label: '₹' + price[indexe].toString(),
                    colour: AppColors.darkblue,
                    weight: FontWeight.w700,
                    fontsize: 14,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                detailMessage,
                style: const TextStyle(fontSize: 12, color: AppColors.darkblue),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                child: Row(
                  children: [
                    customButtonWhiteText(
                      label: "Add",
                      colour: AppColors.primaryColor,
                      onPressed: () async {
                        try {
                          // Get the current user's ID
                          final orderId = _uuid.v4();
                          final orderRef = firestore
                              .collection('Orders')
                              .doc(orderId);

                          await orderRef
                              .set({
                                'id': orderId,
                                'name': names[indexe],
                                'price': price[indexe],
                              })
                              .then((value) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 2),
                                    content: Text('Item added to cart!'),
                                  ),
                                );
                              });
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Item added to error!'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Uuid _uuid = Uuid();

  var indexe = 0;
  List<String> images = [
    'assets/images/neet1.jpg',
    'assets/images/neet2.png',
    'assets/images/neet3.jpg',
    'assets/images/neet4.jpg',
    'assets/images/neet5.jpg',
  ];
  List<String> names = [
    'NCERT Physics',
    'NCERT Chemistry',
    'NCERT Biology',
    'Concepts of Physics',
    'Objective Physics',
  ];
  List<int> price = [499, 399, 599, 499, 699];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          title: customText(
            label: "Book Store",
            colour: AppColors.darkblue,
            weight: FontWeight.bold,
            fontsize: 24,
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          // Adds shadow to the app bar
          centerTitle: true, // Centers the title
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 1,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 18.0,
                                left: 8,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  images[index],
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  label: names[index],
                                  colour: AppColors.darkblue,
                                  weight: FontWeight.bold,
                                  fontsize: 16,
                                ),
                                const SizedBox(height: 5),
                                Row(
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
                                      label: '₹' + price[index].toString(),
                                      colour: AppColors.darkblue,
                                      weight: FontWeight.w700,
                                      fontsize: 15,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12.0,
                                    right: 8,
                                    left: 8,
                                    bottom: 4,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,left: 8.0,
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                setState(() {
                                                  indexe = index;
                                                });

                                                try {
                                                  final orderId = _uuid.v4();
                                                  final orderRef = firestore
                                                      .collection('Orders')
                                                      .doc(orderId);
                                                  await orderRef
                                                      .set({
                                                        'id': orderId,
                                                        'name': names[indexe],
                                                        'price':
                                                            price[indexe]
                                                                .toInt(),
                                                      })
                                                      .then((value) {
                                                        ScaffoldMessenger.of(
                                                          context,
                                                        ).showSnackBar(
                                                          const SnackBar(
                                                            duration: Duration(
                                                              seconds: 2,
                                                            ),
                                                            content: Text(
                                                              'Item added to cart!',
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                } catch (e) {
                                                  print(e);
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      duration: Duration(
                                                        seconds: 2,
                                                      ),
                                                      content: Text(
                                                        'Item added to error!',
                                                      ),
                                                    ),
                                                  );
                                                }

                                                // await firestore.collection('cart').(cartItem)
                                              },
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                      AppColors.primaryColor,
                                                    ),
                                              ),
                                              child: customText(
                                                label: "Add",
                                                colour: Colors.white,
                                                weight: FontWeight.bold,
                                                fontsize: 11,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  indexe = index;
                                                });
                                                switch (index) {
                                                  case 0:
                                                    return showBookDetails(
                                                      indexe = 0,
                                                    );
                                                  case 1:
                                                    return showBookDetails(
                                                      indexe = 1,
                                                    );

                                                  case 2:
                                                    return showBookDetails(
                                                      indexe = 2,
                                                    );
                                                  case 3:
                                                    return showBookDetails(
                                                      indexe = 3,
                                                    );
                                                  case 4:
                                                    return showBookDetails(
                                                      indexe = 4,
                                                    );
                                                }
                                              },
                                              child: customText(
                                                label: "More Details",
                                                colour: AppColors.primaryColor,
                                                weight: FontWeight.w700,
                                                fontsize: 11,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
