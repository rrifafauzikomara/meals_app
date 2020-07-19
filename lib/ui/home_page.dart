import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/common/color_palettes.dart';
import 'package:mealsapp/common/sizes.dart';
import 'package:mealsapp/widget/card.dart';
import 'package:mealsapp/widget/search.dart';

// List of Image
final List<String> imgList = [
  'https://placeimg.com/640/480/any',
  'https://placeimg.com/640/480/any',
  'https://placeimg.com/640/480/any'
];

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Image.network(
          i,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.white,
      appBar: AppBar(
        title: CustomSearch(),
        backgroundColor: ColorPalettes.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(), //kill bounce iOS
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _buildBanner(),
              SizedBox(
                height: Sizes.dp12(context),
              ),
              _buildSeafood(),
              SizedBox(
                height: Sizes.dp12(context),
              ),
              _buildDessert(),
              SizedBox(
                height: Sizes.dp12(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: child,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: map<Widget>(
            imgList,
                (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 2.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? ColorPalettes.blueDark
                      : ColorPalettes.greyTransparent,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSeafood() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Text(
                'Seafood',
                style: TextStyle(
                  color: ColorPalettes.black,
                  fontSize: Sizes.dp14(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorPalettes.blue,
                  size: Sizes.dp16(context),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          child: CustomCard(
            imageUrl:
            'https://placeimg.com/640/480/any',
            mealsName: "Pizza",
          ),
        ),
      ],
    );
  }

  Widget _buildDessert() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Text(
                'Dessert',
                style: TextStyle(
                  color: ColorPalettes.black,
                  fontSize: Sizes.dp14(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorPalettes.blue,
                  size: Sizes.dp16(context),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          child: CustomCard(
            imageUrl:
            'https://placeimg.com/640/480/any',
            mealsName: "Burger",
          ),
        ),
      ],
    );
  }
}