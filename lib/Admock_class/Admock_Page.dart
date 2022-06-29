import 'package:flutter/material.dart';
import 'package:google_admob/Admock_class/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admock_Page extends StatefulWidget {
  @override
  State<Admock_Page> createState() => _Admock_PageState();
}

class _Admock_PageState extends State<Admock_Page> {
  BannerAd _bannerAdTop;
  bool _istopBannerAdReady = false;


  LoadAdvertisement()
  {
    _bannerAdTop = BannerAd(
      adUnitId: AdHelper.topbannerAdUnitId,
      request: AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _istopBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _istopBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAdTop.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
    _createRewaredAd();
    LoadAdvertisement();
  }


  InterstitialAd _interstitialAd;
  RewardedInterstitialAd _rewardedAd;
  int _interstitialLoadAttempts = 0;


  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId:AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          _createInterstitialAd();
        },
      ),
    );
  }


  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd.show();
    }
  }


  void _createRewaredAd(){
    RewardedInterstitialAd.load(
        adUnitId: AdHelper.rewardedAdUnitId,
        request: AdRequest(),

        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            // Keep a reference to the ad so you can show it later.

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedAd = null;
            _createRewaredAd();
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (RewardedInterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
        },
        onAdImpression: (RewardedInterstitialAd ad) => print('$ad impression occurred.'),
      );
      _rewardedAd.show();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad_Mob"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (_istopBannerAdReady)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAdTop.size.width.toDouble(),
                height: _bannerAdTop.size.height.toDouble(),
                child: AdWidget(ad: _bannerAdTop),
              ),
            ),
          RaisedButton(
            child: Text("Save"),
            onPressed: (){
              _showInterstitialAd();
            },
          ),
          RaisedButton(
            child: Text("Rewarded"),
            onPressed: (){
              _showRewardedAd();
            },
          )
        ],
      ),
    );
  }
}
