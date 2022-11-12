import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/provider/country_data_provider.dart';
import 'package:countries_app/screens/detailsScreen/details_portrait.dart';
import 'package:countries_app/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenPortrait extends ConsumerWidget {
  const HomeScreenPortrait({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = ref.watch(apiDataProvider);
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
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.language),
                        SizedBox(
                          width: 4,
                        ),
                        Text('EN')
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.filter_alt_outlined),
                        Text('Filter')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //list of countries and their letters
              country.when(
                  data: (country) {
                    List<Country> countryList =
                        country!.map((e) => e).toList();

                    var sortedList = countryList;
                      sortedList.sort((a,b)=>a.name!.common.toString().compareTo(b.name!.common.toString()));

                    return Expanded(
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
                            })));
                  },
                  error: ((error, stackTrace) => Text(error.toString())),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))
              //list tile will contain
            ],
          ),
        ),
      ),
    );
  }
}
