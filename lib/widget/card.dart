import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/common/color_palettes.dart';
import 'package:mealsapp/common/sizes.dart';

import 'loading.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl, mealsName;
  final Function onTap;

  const CustomCard(
      {Key key, this.imageUrl, this.mealsName, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context) / 2.5,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              // Image
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: Sizes.width(context) / 1.8,
                    width: Sizes.width(context) / 2.5,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => LoadingIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),

              // Background
              Container(
                height: Sizes.width(context) / 1.8,
                width: Sizes.width(context) / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.98],
                    colors: [
                      ColorPalettes.transparent,
                      ColorPalettes.blue,
                    ],
                  ),
                ),
              ),

              // Text and Rating
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.only(left: 6.0, bottom: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        mealsName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: Sizes.dp14(context),
                            fontWeight: FontWeight.bold,
                            color: ColorPalettes.white),
                      ),
                      SizedBox(height: Sizes.dp4(context)),

                      // Rating
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.star,
                                color: ColorPalettes.yellow,
                                size: Sizes.dp18(context),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: ColorPalettes.yellow,
                                size: Sizes.dp18(context),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: ColorPalettes.yellow,
                                size: Sizes.dp18(context),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star,
                                color: ColorPalettes.yellow,
                                size: Sizes.dp18(context),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star_border,
                                color: ColorPalettes.yellow,
                                size: Sizes.dp18(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.dp10(context)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
