import 'package:flutter/material.dart';
import 'package:mealsapp/common/color_palettes.dart';
import 'package:mealsapp/common/sizes.dart';

class CustomSearch extends StatelessWidget {

  final Function onTap;
  const CustomSearch({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Sizes.width(context) / 9,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: ColorPalettes.blueTransparent,
          border: Border.all(color: ColorPalettes.blueTransparent),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: 10.0,
                left: 10.0,
              ),
              child: Icon(
                Icons.search,
                size: Sizes.dp20(context),
                color: ColorPalettes.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 6.0,
              ),
              child: Text(
                'Find Place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.dp16(context),
                  color: ColorPalettes.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}