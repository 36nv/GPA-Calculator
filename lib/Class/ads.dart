import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads {
  InterstitialAd? _interstitialAd;
  showAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-5043552136508563/4992596943",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          _interstitialAd = ad;
          if (_interstitialAd != null) {
            _interstitialAd!.show();
          }
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdWillDismissFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
            },
          );
        }, onAdFailedToLoad: (error) {
          print('error');
        }));
  }
}
