import 'dart:math';
import 'package:business_card_gen/models/business_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTemplatePage extends StatefulWidget {
  const CardTemplatePage({super.key});

  @override
  State<CardTemplatePage> createState() => _CardTemplatePageState();
}

class _CardTemplatePageState extends State<CardTemplatePage> {
  final BusinessCard _businessCard = BusinessCard(
      businessName: "My Business",
      cardHolderName: 'Mehedi Hasan',
      cardHolderEmail: 'mehedi.softdev@gmail.com',
      contactNumber: '+8801927413356',
      businessAddress: 'Gazipur, Dhaka');

  @override
  Widget build(BuildContext context) {
    // Assuming _businessCard is defined somewhere and initialized properly
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen width and height
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          // for card width and height
          double cardWidth = screenWidth > 600 ? 380.0 : screenWidth * 0.7;
          double cardHeight = 220.0;

          return Center(
            child: Stack(
              children: [
                Center(
                  child: Transform.rotate(
                    angle: -pi / 5, // 36 degrees in radians
                    child: Container(
                      width: cardWidth,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade800,
                            offset: Offset.zero,
                            blurRadius: 4.0,
                          )
                        ],
                      ),
                      child: _LeftCardTemplate(
                        boxWidth: double.infinity,
                        boxHeight: double.infinity,
                        businessCard: _businessCard,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth - (screenWidth * 0.75),
                  top: screenHeight - (screenHeight * 0.90),
                  child: Container(
                    width: cardWidth,
                    height: cardHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset.zero,
                          blurRadius: 4.0,
                        )
                      ],
                    ),
                    child: _RightCardTemplate(
                      boxWidth: cardWidth,
                      boxHeight: cardHeight,
                      businessCard: _businessCard,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Card Template",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
    );
  }
}

class _LeftCardTemplate extends StatelessWidget {
  const _LeftCardTemplate({
    required this.boxWidth,
    required this.boxHeight,
    required this.businessCard,
  });

  final double boxWidth;
  final double boxHeight;
  final BusinessCard businessCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade800,
            )
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Business Logo
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.fromLTRB(5, 30, 5, 5),
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]),
              child: Image.asset(
                'assets/images/flutter_logo.png',
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                textAlign: TextAlign.center,
                businessCard.businessName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                textAlign: TextAlign.center,
                businessCard.contactNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                textAlign: TextAlign.center,
                businessCard.businessAddress,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RightCardTemplate extends StatelessWidget {
  const _RightCardTemplate({
    required this.boxWidth,
    required this.boxHeight,
    required this.businessCard,
  });

  final double boxWidth;
  final double boxHeight;
  final BusinessCard businessCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
            )
          ]),
      child: Center(
        child: Row(
          children: [
            // Left Column
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Business Logo
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(5, 30, 5, 5),
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 5.0)
                        ]),
                    child: Image.asset(
                      'assets/images/flutter_logo.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      businessCard.businessName,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      businessCard.contactNumber,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            // Right Column
          ],
        ),
      ),
    );
  }
}
