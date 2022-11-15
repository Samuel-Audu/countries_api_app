import 'package:countries_app/model/country_model.dart';
import 'package:countries_app/screens/detailsScreen/infos.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsPagePortriat extends StatelessWidget {
  DetailsPagePortriat({super.key, required this.e});
  final Country e;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            e.name!.common.toString(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: 190,
                width: 380,
                child: PageView(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(e.flags!.png.toString()))),
                    ),
                    Container(
                      height: 195,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image:
                                  NetworkImage(e.coatOfArms!.png.toString()))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CountryInfo(
                  firstinfo: 'Population:',
                  firstanswer: e.population.toString(),
                  secondinfo: 'Region:',
                  secondanswer: e.region.toString(),
                  thirdinfo: 'Capital:',
                  thirdanswer: e.capital!.isEmpty? '': e.capital![0].toString(),
                  fourthinfo: 'Motto',
                  fourthanswer: 'Not provided in database'),
              const CountryInfo(
                  firstinfo: 'Official language:',
                  firstanswer: 'English',
                  secondinfo: 'Ethnic group:',
                  secondanswer: 'Not provided in database',
                  thirdinfo: 'Religion:',
                  thirdanswer: 'Not provided in database',
                  fourthinfo: 'Government:',
                  fourthanswer: 'Not provided in database'),
              CountryInfo(
                  firstinfo: 'Independence:',
                  firstanswer: e.independent==true?'Yes':'No',
                  secondinfo: 'Area:',
                  secondanswer: e.area.toString(),
                  thirdinfo: 'Currency:',
                  thirdanswer: 'Naira',
                  fourthinfo: 'GDP:',
                  fourthanswer: 'Not provided in database'),
              CountryInfo(
                  firstinfo: 'Time zone:',
                  firstanswer: e.timezones.toString(),
                  secondinfo: 'Date format:',
                  secondanswer: 'dd/mm/yyyy',
                  thirdinfo: 'Dialling code:',
                  thirdanswer: e.idd!.root.toString()+e.idd!.suffixes.toString(),
                  fourthinfo: 'Driving side:',
                  fourthanswer: e.car!.side.toString())    
              
            ],
          ),
        ));
  }
}
