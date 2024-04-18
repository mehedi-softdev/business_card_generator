import 'package:flutter/material.dart';
import 'package:business_card_gen/pages/business_card_info.dart';
import 'package:business_card_gen/pages/card_template_page.dart';
import 'package:business_card_gen/utils/business_card_routes.dart';


void main() {
  runApp(const BusinessCardsApp());
}

class BusinessCardsApp extends StatelessWidget {
  const BusinessCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.light,
      ),
      routes: {
        "/" : (context) => const BusinessCardInfoPage(),
        BCRoutes.cardInfo.route : (context) => const BusinessCardInfoPage(),
        BCRoutes.cardTemplate.route : (context) => const CardTemplatePage(),
      },
    );
  }
}
