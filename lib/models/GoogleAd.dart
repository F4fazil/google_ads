import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAdsApp extends StatefulWidget {
  const GoogleAdsApp({super.key});

  @override
  State<GoogleAdsApp> createState() => _GoogleAdsAppState();
}

class _GoogleAdsAppState extends State<GoogleAdsApp> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  bool _isShowAd = false;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _loadInterstitialAd();
    Timer.periodic(const Duration(seconds: 15), (timer) {
      _showInterstitial();
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isShowAd = true;
      });
    });
  }

  //Load Banner Ad
  void _loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          setState(() {
            _isAdLoaded = false;
          });
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  // Load Interstitial Ad

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
        },
      ),
    );
  }

  // Show Interstitial Ad
  void _showInterstitial() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _loadInterstitialAd();
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _loadInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Testing Google Ads',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showInterstitial();
                    },
                    child: Text('Completed'),
                  ),
                ],
              ),
            ),
            if (_isShowAd && _isAdLoaded)
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
