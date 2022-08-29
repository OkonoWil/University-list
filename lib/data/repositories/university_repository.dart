import 'package:university_list/data/models/university_model.dart';
import 'package:dio/dio.dart';

class UniversityRepository {
  late Dio http;
  UniversityRepository({required this.http});

  Future<List<UniversityModel>> find() async {
    List<UniversityModel> results = [];
    Response response = await http
        .get("http://universities.hipolabs.com/search?country=france");

    return results;
  }
}
