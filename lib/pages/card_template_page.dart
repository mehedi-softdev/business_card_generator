import 'dart:math';
import 'package:business_card_gen/models/business_card.dart';
import 'package:flutter/material.dart';

class CardTemplatePage extends StatefulWidget {
  const CardTemplatePage({super.key});

  @override
  State<CardTemplatePage> createState() => _CardTemplatePageState();
}

class _CardTemplatePageState extends State<CardTemplatePage> {
  BusinessCard? _businessCard;

  @override
  Widget build(BuildContext context) {
    // catching argument of businessCard
    _businessCard = ModalRoute
        .of(context)
        ?.settings
        .arguments as BusinessCard;

    if (_businessCard == null) {
      return const ErrorScreen(errorMessage: "System Internal Error");
    } else {
      return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Get the screen width and height
            double screenWidth = MediaQuery
                .of(context)
                .size
                .width;
            double screenHeight = MediaQuery
                .of(context)
                .size
                .height;
            // for card width and height
            double cardWidth = screenWidth > 600 ? 400.0 : screenWidth * 0.85;
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
                          businessCard: _businessCard!,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth - (screenWidth * 0.90),
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
                        businessCard: _businessCard!,
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
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Business Logo
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                    padding: const EdgeInsets.all(4.0),
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
                  // Business Name
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      businessCard.businessName,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Contact Number
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          businessCard.contactNumber,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: VerticalDivider(
                    thickness: 1.2,
                  ),
                )),
            // Right Column
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    // Card Holder Name
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        businessCard.cardHolderName,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    // Card Holder email
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        businessCard.cardHolderEmail,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    // work description (default value)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non diam eget libero efficitur tinsnia.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    // Business Address
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        businessCard.businessAddress,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery
            .sizeOf(context)
            .width - 100,
        height: MediaQuery
            .sizeOf(context)
            .height,
        padding: const EdgeInsets.all(16.0),
        child: Text(errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
          ),),
      ),
    );
  }
}

