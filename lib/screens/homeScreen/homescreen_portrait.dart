// ignore_for_file: deprecated_member_use

import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/provider/country_data_provider.dart';
import 'package:countries_app/screens/detailsScreen/details_portrait.dart';
import 'package:countries_app/widgets/buttons.dart';
import 'package:countries_app/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenPortrait extends ConsumerWidget {
  
  const HomeScreenPortrait({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    final country = ref.watch(countriesList.state).state;

    final List<Country>? countries = country;
    var sortedList = countries;
                      sortedList!.sort((a,b)=>a.name!.common.toString().compareTo(b.name!.common.toString()));


  
    


    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //row of explore and sun icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Icon(
                    Icons.light_mode_outlined,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //container of search country
              Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                  
                    ref.read(searchedCountryTextProvided.state).state= value;
                  },
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Country',
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //row of container globe icon and en and filter icon and filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    buttonName: 'EN', 
                    icon: Icons.language_outlined),
                  MyButton( 
                    buttonName: 'Filter', 
                    icon: Icons.filter_alt_outlined)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //list of countries and their letters
              Expanded(
                        child: ListView.builder(
                            itemCount: sortedList.length,
                            itemBuilder: ((context, index) {
                    
                              return CountryTile(
                                  name: sortedList[index].name!.common.toString(),
                                  capital: sortedList[index].capital!.isEmpty?'':
                              sortedList[index].capital![0].toString(), 
                                  image:sortedList[index].flags!.png.toString(), 
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPagePortriat(e: sortedList[index],))));
                            })))
              //list tile will contain
            ],
          ),
        ),
      ),
    );
    
  }
}

