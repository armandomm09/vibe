import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/mainBottomBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nav Container"),
      ),
      body: const Center(
        child: Text("This is home page"),
      ),
    );
  }
}