// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_init_to_null, prefer_const_constructors, import_of_legacy_library_into_null_safe, avoid_print, unused_local_variable, prefer_collection_literals, unused_element, sized_box_for_whitespace, dead_code, unused_import
// @dart=2.9

import 'package:air_shoes/details.dart';
import 'package:air_shoes/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance
      .collection('shoes')
      .withConverter<Shoes>(
          fromFirestore: (snapshot, _) => Shoes.fromJson(snapshot.data()),
          toFirestore: (shoes, _) => shoes.toJson());

  var brands = null;
  int _selectedIndex = 0;

  final Shoes data;
  _HomePageState({this.data});

  Widget header() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            height: 48,
            width: 207,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // NOTE :: Form text field for Search
                Image.asset(
                  'assets/search_icon.png',
                  height: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    style: buttonTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Lifestyle Shoe',
                      hintStyle: buttonTextStyle.copyWith(
                        color: secondaryGreyColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // // NOTE :: End Form text field for Search

          SizedBox(
            width: 12,
          ),

          // NOTE :: Cart Widget
          Container(
            padding: EdgeInsets.all(12),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset('assets/bag_icon.png'),
          ),
          // NOTE :: End Cart Widget

          SizedBox(
            width: 12,
          ),

          // NOTE :: Notification Widget
          Container(
            padding: EdgeInsets.all(12),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset('assets/notification_icon.png'),
          ),
          // NOTE :: End Notification Widget
        ],
      ),
    );
  }

  Widget discountCart() {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // NOTE :: Discount Cart 1
            Container(
              height: 130,
              width: 315,
              decoration: BoxDecoration(
                color: fourOrangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/bg.png',
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 100,
                        width: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/adidas1_2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // NOTE :: Text Desc Promo
                            Text(
                              'Get 50% discount \n for all Adidas items',
                              style: cartTextStyle,
                              textAlign: TextAlign.left,
                            ),
                            // NOTE :: END Text Desc Promo

                            SizedBox(
                              height: 30,
                            ),

                            // NOTE :: Button Tap For Details
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              height: 23,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: secondaryorangeColor,
                                ),
                              ),
                              child: Text(
                                'Tap for details',
                                style: descTextStyle.copyWith(
                                    color: secondaryorangeColor),
                              ),
                            ),
                            // NOTE :: END Button Tap For Details
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // NOTE :: END Discount Cart 1
            SizedBox(
              width: 12,
            ),

            // NOTE :: Discount Cart 2
            Container(
              height: 130,
              width: 315,
              decoration: BoxDecoration(
                color: secondaryPurpleColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/bg.png',
                        color: thirdPurpleColor,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 100,
                        width: 210,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/adidas2_2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // NOTE :: Text Desc Promo
                            Text(
                              'Get 50% discount \n for all Adidas items',
                              style: cartTextStyle,
                              textAlign: TextAlign.left,
                            ),
                            // NOTE :: END Text Desc Promo

                            SizedBox(
                              height: 30,
                            ),

                            // NOTE :: Button Tap For Details
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              height: 23,
                              width: 100,
                              decoration: BoxDecoration(
                                color: secondaryPurpleColor,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: purpleColor,
                                ),
                              ),
                              child: Text(
                                'Tap for details',
                                style:
                                    descTextStyle.copyWith(color: purpleColor),
                              ),
                            ),
                            // NOTE :: END Button Tap For Details
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // NOTE :: END Discount Cart 2

            SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget categories() {
    return StreamBuilder<QuerySnapshot>(
      stream: db.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }

        // Get Data to Object Shoes
        List<QueryDocumentSnapshot<Shoes>> shoes = snapshot.data.docs;
        List<Widget> categoriesCart = [];
        List<String> brand = [];
        List<String> logo = [];
        for (var i = 0; i < shoes.length; i++) {
          brand.add(shoes[i].data().brand);
          logo.add(shoes[i].data().logo);
        }

        var seen = Set<String>();
        List<String> uniqueBrand =
            brand.where((brand) => seen.add(brand)).toList();

        var seenLogo = Set<String>();
        List<String> uniqueLogo = logo.where((logo) => seen.add(logo)).toList();

        for (var i = 0; i < uniqueBrand.length; i++) {
          categoriesCart.add(
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      brands = uniqueBrand[i];
                    });
                  },
                  child: Container(
                    height: 36,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(58),
                      color: brands == uniqueBrand[i] ? blackColor : whiteColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/${uniqueLogo[i]}.png',
                          color:
                              brands == uniqueBrand[i] ? whiteColor : greyColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          uniqueBrand[i],
                          style: buttonTextStyle.copyWith(
                              color: brands == uniqueBrand[i]
                                  ? whiteColor
                                  : greyColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          );
        }
        return Container(
          padding: EdgeInsets.only(top: 24, left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      brands = null;
                    });
                  },
                  child: Container(
                    height: 36,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(58),
                      color: brands == null ? blackColor : whiteColor,
                    ),
                    child: Text(
                      'All',
                      style: buttonTextStyle.copyWith(
                          color: brands == null ? whiteColor : greyColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Row(
                  children: categoriesCart,
                ),
                SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget shoesCart() {
    return StreamBuilder<QuerySnapshot>(
      stream: db.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }

        // Get Data to Object Shoes
        List<QueryDocumentSnapshot<Shoes>> shoes = snapshot.data.docs;
        List<Widget> shoesCart = [];
        List<Widget> brandShoesCart = [];
        CollectionReference shoesReference =
            FirebaseFirestore.instance.collection('shoes');

        for (var i = 0; i < shoes.length; i++) {
          int number = shoes[i].data().price;
          int decimalDigit = 2;
          if (brands != shoes[i].data().brand) {
            shoesCart.add(Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              height: 180,
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/${shoes[i].data().images[0]}.png',
                              width: 150,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                if (shoes[i].data().isFavorite == false) {
                                  shoesReference
                                      .doc((i + 1).toString())
                                      .update({'isFavorite': true});
                                } else {
                                  shoesReference
                                      .doc((i + 1).toString())
                                      .update({'isFavorite': false});
                                }
                              },
                              child: Image.asset(
                                'assets/love_icon.png',
                                color: shoes[i].data().isFavorite == true
                                    ? orangeColor
                                    : greyColor,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'for Lifestyle',
                          style: descTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          shoes[i].data().name,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          shoes[i].data().desc,
                          overflow: TextOverflow.ellipsis,
                          style: descTextStyle,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                CurrencyFormat.convertToIdr(number, 0),
                                style: titleTextStyle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(shoes: shoes[i].data()),
                                    ));
                              },
                              child: Container(
                                height: 32,
                                width: 59,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(63),
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy',
                                    style: secondaryButtonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          } else if (shoes[i].data().brand == brands) {
            brandShoesCart.add(Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              height: 180,
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/${shoes[i].data().images[0]}.png',
                              width: 150,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                if (shoes[i].data().isFavorite == false) {
                                  shoesReference
                                      .doc((i + 1).toString())
                                      .update({'isFavorite': true});
                                } else {
                                  shoesReference
                                      .doc((i + 1).toString())
                                      .update({'isFavorite': false});
                                }
                              },
                              child: Image.asset(
                                'assets/love_icon.png',
                                color: shoes[i].data().isFavorite == true
                                    ? orangeColor
                                    : greyColor,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'for Lifestyle',
                          style: descTextStyle,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          shoes[i].data().name,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          shoes[i].data().desc,
                          overflow: TextOverflow.ellipsis,
                          style: descTextStyle,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                CurrencyFormat.convertToIdr(number, 0),
                                style: titleTextStyle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(shoes: shoes[i].data()),
                                  ),
                                );
                              },
                              child: Container(
                                height: 32,
                                width: 59,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(63),
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy',
                                    style: secondaryButtonTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          }
        }
        return Padding(
          padding: EdgeInsets.only(top: 2, right: 24, left: 24),
          child: Column(
            children: brands == null ? shoesCart : brandShoesCart,
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/home_icon.png'),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/search_icon.png'),
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/transaction_icon.png'),
          ),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/profile_icon.png'),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: orangeColor,
      unselectedItemColor: secondaryGreyColor,
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: bottomNavBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          header(),
          discountCart(),
          categories(),
          shoesCart(),
        ],
      ),
    );
  }
}
