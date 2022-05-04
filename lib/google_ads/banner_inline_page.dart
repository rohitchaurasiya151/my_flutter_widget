

// COMPLETE: Import google_mobile_ads.dart
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter/material.dart';

import 'ad_helper.dart';
import 'destination.dart';

class BannerInlinePage extends StatefulWidget {
  final List<Destination> entries;

  BannerInlinePage({
    required this.entries,
  });

  @override
  State createState() => _BannerInlinePageState();
}

class _BannerInlinePageState extends State<BannerInlinePage> {
  // COMPLETE: Add _kAdIndex
  static final _kAdIndex = 4;

  // COMPLETE: Add a BannerAd instance
  late BannerAd _ad;

  // COMPLETE: Add _isAdLoaded
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();

    // COMPLETE: Create a BannerAd instance
    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    // COMPLETE: Load an ad
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdMob Banner Inline Ad'),
      ),
      body: ListView.builder(
        // COMPLETE: Adjust itemCount based on the ad load state
        itemCount: widget.entries.length + (_isAdLoaded ? 1 : 0),
        itemBuilder: (context, index) {
          // COMPLETE: Render a banner ad
          if (_isAdLoaded && index == _kAdIndex) {
            return Container(
              child: AdWidget(ad: _ad),
              width: _ad.size.width.toDouble(),
              height: 72.0,
              alignment: Alignment.center,
            );
          } else {
            // COMPLETE: Get adjusted item index from _getDestinationItemIndex()
            final item = widget.entries[_getDestinationItemIndex(index)];

            return ListTile(
              leading: Image.asset(
                item.asset,
                width: 48,
                height: 48,
                package: 'flutter_gallery_assets',
                fit: BoxFit.cover,
              ),
              title: Text(item.name),
              subtitle: Text(item.duration),
              onTap: () {
                print('Clicked ${item.name}');
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // COMPLETE: Dispose a BannerAd object
    _ad.dispose();
    super.dispose();
  }

  // COMPLETE: Add _getDestinationItemIndex()
  int _getDestinationItemIndex(int rawIndex) {
    if (rawIndex >= _kAdIndex && _isAdLoaded) {
      return rawIndex - 1;
    }
    return rawIndex;
  }
}
