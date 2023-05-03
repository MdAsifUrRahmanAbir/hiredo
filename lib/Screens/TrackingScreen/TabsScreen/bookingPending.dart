import 'package:flutter/material.dart';


class BookingPandeingScreen extends StatelessWidget {
  const BookingPandeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) { return const Text("pending"); },
      
    );
  }
}