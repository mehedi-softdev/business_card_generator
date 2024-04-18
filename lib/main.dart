import 'package:business_card_gen/pages/business_card_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessCardsApp());
}

class BusinessCardsApp extends StatelessWidget {
  const BusinessCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BusinessCardInfo(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.light,
      ),
    );
  }
}
