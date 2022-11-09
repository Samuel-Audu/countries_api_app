import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenPortrait extends StatelessWidget {
  const HomeScreenPortrait({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text('Explore',
                  style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  const Icon(Icons.sunny,)
                ],
              ),
              const SizedBox(height: 10,),
              //container of search country
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
                child: const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Country',
                    prefixIcon: Icon(Icons.search)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //row of container globe icon and en and filter icon and filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.language),
                        SizedBox(width: 4,),
                        Text('EN')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
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
              )
              //list of countries and their letters
              
              //list tile will contain 
            ],
          ),),),
    );
  }
}