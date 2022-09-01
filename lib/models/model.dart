// @dart=2.9

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Shoes {
  final String brand;
  final String desc;
  final List<String> images;
  bool isFavorite;
  final String logo;
  final String name;
  final int price;

  Shoes({
    this.brand,
    this.desc,
    this.images,
    this.isFavorite,
    this.logo,
    this.name,
    this.price,
  });

  Shoes.fromJson(Map<String, Object> json)
      : this(
          brand: json['brand'] as String,
          desc: json['desc'] as String,
          images: (json['images'] as List).cast<String>(),
          isFavorite: json['isFavorite'] as bool,
          logo: json['logo'] as String,
          name: json['name'] as String,
          price: json['price'] as int,
        );

  Map<String, Object> toJson() {
    return {
      'brand': brand,
      'desc': desc,
      'images': images,
      'isFavorite': isFavorite,
      'logo': logo,
      'name': name,
      'price': price,
    };
  }
}
