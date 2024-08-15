import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/Provider/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';



final mealProvider = Provider((ref) => dummyMeals);



