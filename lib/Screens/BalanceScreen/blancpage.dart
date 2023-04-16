import 'package:flutter/cupertino.dart';

class BlankPage extends StatefulWidget {
  static const String routename = 'blank';
  const BlankPage({Key? key}) : super(key: key);

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  
  }
}
