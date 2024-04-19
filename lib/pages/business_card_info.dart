import 'package:business_card_gen/models/business_card.dart';
import 'package:business_card_gen/utils/business_card_routes.dart';
import 'package:flutter/material.dart';

class BusinessCardInfoPage extends StatefulWidget {
  const BusinessCardInfoPage({super.key});

  @override
  State<BusinessCardInfoPage> createState() => _BusinessCardInfoPageState();
}

class _BusinessCardInfoPageState extends State<BusinessCardInfoPage> {
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
  // controllers
  final TextEditingController _businessNameText = TextEditingController();
  final TextEditingController _cardHolderNameText = TextEditingController();
  final TextEditingController _contactNumberText = TextEditingController();
  final TextEditingController _cardHolderEmailText = TextEditingController();
  final TextEditingController _addressText = TextEditingController();
  bool _isValid = true;
  String _errorMessage = '';

  void _generateButtonEvent() {
    BusinessCard businessCard = BusinessCard(
      businessName: _businessNameText.text.toString(),
      cardHolderName: _cardHolderNameText.text.toString(),
      cardHolderEmail: _cardHolderEmailText.text.toString(),
      contactNumber: _contactNumberText.text.toString(),
      businessAddress: _addressText.text.toString(),
    );
    // validating
    if (!_isInputValid(businessCard)) {
      setState(() {
        _errorMessage = "Please fill all the field";
        _isValid = false;
      });
      return;
    }
    // now navigate to card Template page
    Navigator.pushNamed(context, BCRoutes.cardTemplate.route,
        arguments: businessCard);
  }

  bool _isInputValid(BusinessCard businessCard) {
    if (businessCard.businessName.isEmpty) {
      return false;
    } else if (businessCard.cardHolderName.isEmpty) {
      return false;
    } else if (businessCard.cardHolderEmail.isEmpty) {
      return false;
    } else if (businessCard.contactNumber.isEmpty) {
      return false;
    } else if (businessCard.businessAddress.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemWidth = screenWidth > 600 ? 400.0 : screenWidth * 0.8;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    // error message box
                    if (!_isValid)
                      SizedBox(
                        width: itemWidth,
                        child: Center(
                          child: Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: itemWidth + 200,
                      child: Row(
                        children: [
                          // Business Name Field
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              child: TextField(
                                controller: _businessNameText,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.business),
                                  hintText: 'Business Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Card Holder Name Field
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              child: TextField(
                                controller: _cardHolderNameText,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Card Holder Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: itemWidth + 200,
                      child: Row(
                        children: [
                          // Card Holder Email Field
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              child: TextField(
                                controller: _cardHolderEmailText,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: 'Card Holder Email',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Card Holder Contact Number Field
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              child: TextField(
                                controller: _contactNumberText,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: 'Phone Number',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: itemWidth + 200,
                      child: Row(
                        children: [
                          // Business Address Field
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              child: TextField(
                                controller: _addressText,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.place),
                                  hintText: 'Business Address',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.lightGreen,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                              child: SizedBox(
                            width: 300,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: itemWidth + 200,
                      child: Row(
                        children: [
                          const Expanded(
                              child: SizedBox(
                            width: 300,
                          )),
                          // Form Buttons area
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              width: itemWidth,
                              height: 40.0,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                onPressed: _generateButtonEvent,
                                child: const Text("Generate"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          // element by element for all other screens
          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    // error message box
                    if (!_isValid)
                      SizedBox(
                        width: itemWidth,
                        child: Center(
                          child: Text(
                            _errorMessage,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    // Business Name Field
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      child: TextField(
                        controller: _businessNameText,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.business),
                          hintText: 'Business Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.lightGreen,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    // Card Holder Name Field
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      child: TextField(
                        controller: _cardHolderNameText,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Card Holder Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.lightGreen,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    // Card Holder Email Field
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      child: TextField(
                        controller: _cardHolderEmailText,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Card Holder Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.lightGreen,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    // Card Holder Contact Number Field
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      child: TextField(
                        controller: _contactNumberText,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Phone Number',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.lightGreen,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    // Business Address Field
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      child: TextField(
                        controller: _addressText,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          hintText: 'Business Address',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.lightGreen,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    // Form Buttons area
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: itemWidth,
                      height: 40.0,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        onPressed: _generateButtonEvent,
                        child: const Text("Generate"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
