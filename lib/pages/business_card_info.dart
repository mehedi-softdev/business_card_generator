import 'package:flutter/material.dart';

class BusinessCardInfo extends StatefulWidget {
  const BusinessCardInfo({super.key});

  @override
  State<BusinessCardInfo> createState() => _BusinessCardInfoState();
}

class _BusinessCardInfoState extends State<BusinessCardInfo> {
  String? businessName;
  String? userName;
  String? contactNumber;
  String? email, address;
  String? businessNameError, userNameError, contactNumberError;
  String? emailError, addressError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const CardInfoDesign(),
    );
  }

  // Business Card AppBar
  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        "Card Info Form",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.lightGreen,
    );
  }
}

class CardInfoDesign extends StatefulWidget {
  const CardInfoDesign({super.key});

  @override
  State<CardInfoDesign> createState() => _CardInfoDesignState();
}

class _CardInfoDesignState extends State<CardInfoDesign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Business Name Field
        Container(
          margin: const EdgeInsets.all(5.0),
          width: 300,
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Business Name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          width: 300,
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Your Name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
