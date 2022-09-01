// ignore_for_file: use_key_in_widget_constructors, override_on_non_overriding_member, unused_local_variable, annotate_overrides, avoid_print, unused_element, unused_field, unused_import, sdk_version_constructor_tearoffs, no_leading_underscores_for_local_identifiers, prefer_const_constructors, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, await_only_futures, missing_return, avoid_init_to_null, missing_required_param
// @dart=2.9

import 'package:air_shoes/details.dart';
import 'package:air_shoes/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:air_shoes/models/model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'details': ((context) => DetailsPage())
      },
    );
  }
}
