import 'package:flutter/material.dart';
import 'package:university_list/data/models/university_model.dart';
import 'package:university_list/data/repositories/university_repository.dart';

class UniversityProvider extends ChangeNotifier {
  late UniversityRepository universityRepository;
  UniversityProvider({
    required this.universityRepository,
  });
  bool isLoading = false;
  List<UniversityModel>? _university;
  List<UniversityModel>? _universityList;
  List<UniversityModel>? get universityList => _universityList;
  List<UniversityModel>? get university => _university;

  loadItems(String country) async {
    _university = await universityRepository.find(country);
    notifyListeners();
  }

  loadItems2(String country) async {
    isLoading = true;
    _universityList = await universityRepository.find(country);
    isLoading = false;
    notifyListeners();
  }
}




//http://universities.hipolabs.com/search?country=france