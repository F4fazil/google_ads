import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:googlead/src/onboarding/onboarding_screen.dart';
import 'package:googlead/views/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}
