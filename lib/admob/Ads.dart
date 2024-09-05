import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quizz_app/globals.dart' as globals;

class Ads {
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  int _rewardedscore = 0;

  Ads() {
    _createRewardedAd();
  }

  void showAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-6180915705872902/7093180827",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          if (_interstitialAd != null) {
            _interstitialAd!.show();
          }
          ad.fullScreenContentCallback =
              FullScreenContentCallback(onAdWillDismissFullScreenContent: (ad) {
            ad.dispose();
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
          });
        },
        onAdFailedToLoad: (error) {
          print(error);
        },
      ),
    );
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-6180915705872902/7864245519",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("Failed to load a rewarded ad: $error");
          _rewardedAd = null;
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _createRewardedAd();
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createRewardedAd();
      });
      _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
        _rewardedscore++;
        globals.setCoins(globals.coins + 5);
        print(_rewardedAd);
        print(globals.coins.toString());

        final player = AudioPlayer();
        Future<void> playsound1() async {
          String audiopath = "newsounds/coin.wav";
          await player.play(AssetSource(audiopath));
        }

        playsound1();
      });
      _rewardedAd = null;
    }
  }
}
