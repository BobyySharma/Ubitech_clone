import 'dart:async';
import 'package:flutter/material.dart';
import 'loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network('https://play-lh.googleusercontent.com/v4DktIy6rdfzMvNnWomq3PeRtNAbIbSoExlrcu2pgpNhzecIJRw6fKNFe9-nx1_lci4=w600-h300-pc0xffffff-pd'),
      ),
    );
  }
}
