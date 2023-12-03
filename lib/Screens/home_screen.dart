import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_calculator/Class/ads.dart';
import 'package:gpa_calculator/Colors/my_colors.dart';
import 'package:gpa_calculator/Screens/calculator_screen.dart';
import 'package:gpa_calculator/Screens/contact_us.dart';
import 'package:gpa_calculator/Widgets/my_text_widget.dart';
import 'package:gpa_calculator/constants/navigation.dart';
import 'package:gpa_calculator/constants/spacings.dart';
import 'package:gpa_calculator/extensions/screen_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
  bool isLoaded = false;
  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: "ca-app-pub-5043552136508563/7238668091",
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    )..load();
  }

  void initState() {
    loadAd();
    super.initState();
  }

  void dispose() {
    if (isLoaded) {
      bannerAd!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  textIn: "حاسبة المعدل",
                  textSize: 50,
                  isBold: true,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          kVSpace64,
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: MyColors.secondaryColor,
                border: Border.all(
                  color: MyColors.blackColor,
                  width: 3,
                ),
              ),
              child: Center(
                  child: Transform.rotate(
                angle: -15 * 3.141592653589793 / 180,
                child: Text(
                  "A+",
                  style: TextStyle(fontSize: 150),
                ),
              )),
            ),
          ),
          kVSpace64,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kHSpace12,
              InkWell(
                onTap: () => ContactUs().push(context),
                child: Container(
                  height: context.getHeight() / 8,
                  width: 150,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: MyText(
                      textIn: "تواصل معنا",
                      textSize: 30,
                      isBold: true,
                      textColor: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              kHSpace12,
              InkWell(
                onTap: () async {
                  if (isLoaded) {
                    await Ads().showAd();
                    CalculatorScreens().push(context);
                  } else {
                    CalculatorScreens().push(context);
                  }
                },
                child: Container(
                  height: context.getHeight() / 8,
                  width: 150,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: MyText(
                      textIn: "احسب الأن",
                      textSize: 30,
                      isBold: true,
                      textColor: MyColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              kHSpace12,
            ],
          ),
          kVSpace64,
          Center(
            child: isLoaded
                ? Expanded(
                    child: SizedBox(
                      width: bannerAd!.size.width.toDouble(),
                      height: bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: bannerAd!),
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
