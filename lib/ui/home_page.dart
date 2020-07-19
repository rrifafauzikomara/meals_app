import 'package:flutter/material.dart';
import 'package:mealsapp/common/color_palettes.dart';
import 'package:mealsapp/common/sizes.dart';
import 'package:mealsapp/network/api/api_provider.dart';
import 'package:mealsapp/network/model/categories.dart';
import 'package:mealsapp/widget/banner.dart';
import 'package:mealsapp/widget/card.dart';
import 'package:mealsapp/widget/loading.dart';
import 'package:mealsapp/widget/search.dart';

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
    return FutureBuilder(
      future: MealsApi().categoryList(),
      builder:
          (BuildContext context, AsyncSnapshot<CategoriesResult> snapshot) {
        if (snapshot.hasData) {
          return CustomBanner(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            snapshot: snapshot,
            currentIndex: _current,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(
          width: Sizes.width(context),
          height: Sizes.width(context) / 2,
          child: LoadingIndicator(),
        );
      },
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
            imageUrl: 'https://placeimg.com/640/480/any',
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
            imageUrl: 'https://placeimg.com/640/480/any',
            mealsName: "Burger",
          ),
        ),
      ],
    );
  }
}
