import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/common/color_palettes.dart';
import 'package:mealsapp/common/sizes.dart';
import 'package:mealsapp/network/model/categories.dart';

import 'loading.dart';

class CustomBanner extends StatefulWidget {
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;
  final AsyncSnapshot<CategoriesResult> snapshot;
  final int currentIndex;

  const CustomBanner(
      {Key key, this.onPageChanged, this.snapshot, this.currentIndex})
      : super(key: key);

  @override
  _CustomBannerState createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Banner
        Container(
          height: Sizes.width(context) / 2,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              viewportFraction: 1.0,
              aspectRatio: 2.0,
              onPageChanged: widget.onPageChanged,
            ),
            items: <Widget>[
              for (var i = 0; i < widget.snapshot.data.categories.length; i++)
                Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        widget.snapshot.data.categories[i].strCategoryThumb,
                    width: Sizes.width(context),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => LoadingIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
            ],
          ),
        ),

        // Dot Indicator of Banner
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.snapshot.data.categories.map((url) {
            var index = widget.snapshot.data.categories.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.currentIndex == index
                    ? ColorPalettes.blueDark
                    : ColorPalettes.greyTransparent,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
