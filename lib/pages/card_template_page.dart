import 'package:flutter/material.dart';

class CardTemplatePage extends StatefulWidget {
  const CardTemplatePage({super.key});

  @override
  State<CardTemplatePage> createState() => _CardTemplatePageState();
}

class _CardTemplatePageState extends State<CardTemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Center(
        child: Text("working..."),
      ),
    );
  }

  // Card Template Page Appbar
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
