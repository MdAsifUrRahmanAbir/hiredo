import 'package:flutter/material.dart';

import 'package:myapp/utils/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color:themeColorGreen,
        
      ),
    );
  }
}