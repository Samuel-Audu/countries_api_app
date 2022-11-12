

import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/services/nework_sevice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiDataProvider = FutureProvider<List<Country>?>((ref) async{
  return ref.watch(apiServiceProvider).getCountries();
});