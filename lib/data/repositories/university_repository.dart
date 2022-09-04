import 'package:university_list/data/models/university_model.dart';
import 'package:dio/dio.dart';

class UniversityRepository {
  late Dio http;
  UniversityRepository({
    required this.http,
  });
  Future<List<UniversityModel>> find(String country) async {
    List<UniversityModel> results = [];
    Response response = await http.get("/search?country=$country");
    for (int i = 0; i < response.data.length; i++) {
      var jsonItem = response.data[i];
      results.add(UniversityModel.fromJson(jsonItem));
    }

    return results;
  }
}
