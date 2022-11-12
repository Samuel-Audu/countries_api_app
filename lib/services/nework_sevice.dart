import 'dart:convert';

import 'package:countries_app/model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService{
  // String endpoint = "https://restcountries.com/v3.1/all";

  Future<List<Country>> getCountries() async{
    http.Response response = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    if (response.statusCode==200){
      final List result = jsonDecode(response.body) ;
      return result.map((e) => Country.fromJson(e)).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}
