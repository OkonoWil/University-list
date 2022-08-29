import 'package:flutter/material.dart';
import 'package:university_list/data/models/university_model.dart';
import 'package:university_list/data/repositories/university_repository.dart';

class UniversityProvider extends ChangeNotifier {
  late UniversityRepository universityRepository;
  UniversityProvider({
    required this.universityRepository,
  });
  List<UniversityModel>? _university;
  List<UniversityModel>? get university => _university;

  loadItems() async {
    _university = await universityRepository.find();
    notifyListeners();
  }
}




//http://universities.hipolabs.com/search?country=france