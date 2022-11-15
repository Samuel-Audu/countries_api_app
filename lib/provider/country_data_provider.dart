

import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/services/nework_sevice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiDataProvider = FutureProvider<List<Country>?>((ref) async{
  final countries = ref.watch(apiServiceProvider).getCountries();

  var countriesList = countries;
  
  return countriesList;
});


final searchProvider = StateProvider<List<Country>?>((ref){
  // We return the default sort type, here name.
  final searchList = ref.watch(apiDataProvider).value;

  return searchList;
});

 final searchedCountryProvider = StateProvider<List<Country>?>((_) => _.watch(searchProvider));

 final searchedCountryTextProvided = StateProvider<String>((ref) => '');

 final countriesList = StateProvider<List<Country>?>((ref) {
  final searchText = ref.watch(searchedCountryTextProvided);
    // ignore: deprecated_member_use
  final searchedCountry = ref.watch(searchedCountryProvider.state).state;

  List<Country>? searchResult = [];

  if(searchText.isEmpty){
      searchResult = searchedCountry;
    }else{
      searchResult = searchedCountry!.where((element) =>
        element.name!.common!.toLowerCase().contains(searchText.toLowerCase())).toList();
    }

  return searchResult;
 });
 

