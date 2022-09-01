// ignore_for_file: unused_import, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors, unused_local_variable, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:air_shoes/theme.dart';
import 'package:air_shoes/models/model.dart';
import 'home.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.shoes});
  final Shoes shoes;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int index = 0;
  int sizes = 9;
  int indexSize = 4;

  Widget header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/back_icon.png'),
            ),
          ),
          const SizedBox(
            width: 37,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.shoes.name,
                  style: titleTextStyle.copyWith(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Men\'s Lifestyle Shoes',
                  style: descTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 22,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/love_icon.png',
              color: widget.shoes.isFavorite == true
                  ? orangeColor
                  : secondaryGreyColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget displayIcon() {
    List<Widget> icon = [];
    for (var i = 0; i < widget.shoes.images.length; i++) {
      icon.add(
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = i;
                  print(index);
                });
              },
              child: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border:
                      Border.all(color: i == index ? orangeColor : whiteColor),
                  image: DecorationImage(
                    image: AssetImage('assets/${widget.shoes.images[i]}.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      );
    }
    return Row(
      children: icon,
    );
  }

  Widget shoesDisplay() {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      height: 327,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${widget.shoes.images[index]}.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          displayIcon(),
        ],
      ),
    );
  }

  Widget sizeChart() {
    List<Widget> sizeCart = [];
    for (var i = 4; i <= sizes; i++) {
      sizeCart.add(
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  indexSize = i;
                });
              },
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: indexSize == i ? orangeColor : whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    i.toString(),
                    style: cartTextStyle.copyWith(
                      color: indexSize == i ? whiteColor : greyColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 14,
            ),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: sizeCart,
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Widget size() {
    return Container(
      padding: EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Size',
            style: secondaryButtonTextStyle.copyWith(
              fontSize: 16,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          sizeChart(),
        ],
      ),
    );
  }

  Widget desc() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: secondaryButtonTextStyle.copyWith(
              fontSize: 16,
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ReadMoreText(
            widget.shoes.desc,
            style: descTextStyle.copyWith(
              fontSize: 14,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.justify,
            trimLines: 3,
            trimMode: TrimMode.Length,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
            moreStyle: descTextStyle.copyWith(
              color: orangeColor,
              fontSize: 14,
            ),
            lessStyle: descTextStyle.copyWith(
              color: orangeColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    int number = widget.shoes.price;
    int decimalDigit = 2;
    return BottomAppBar(
      child: Container(
        height: 102,
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              CurrencyFormat.convertToIdr(number, 2),
              style: titleTextStyle.copyWith(
                color: orangeColor,
                fontSize: 20,
              ),
            ),
            Container(
              height: 54,
              width: 172,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: orangeColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/bag_icon.png',
                    width: 24,
                    color: whiteColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add to Bag',
                    style: secondaryButtonTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: footer(),
      body: ListView(
        children: [
          header(context),
          shoesDisplay(),
          size(),
          desc(),
        ],
      ),
    );
  }
}
