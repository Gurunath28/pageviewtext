import 'package:flutter/material.dart';
import 'package:page_view_text_guru/appdata_text.dart';

class DisplayText extends StatelessWidget {
  final AppDataText appDataText;

  const DisplayText({super.key, required this.appDataText});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.black),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                appDataText.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
              ),
            ),
          ),
        ),
      ),

    ]);
  }
}
