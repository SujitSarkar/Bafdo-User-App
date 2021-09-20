import 'package:flutter/material.dart';

class FestivalPage extends StatefulWidget {
  const FestivalPage({Key? key}) : super(key: key);

  @override
  _FestivalPageState createState() => _FestivalPageState();
}

class _FestivalPageState extends State<FestivalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Festival')),
    );
  }
}
