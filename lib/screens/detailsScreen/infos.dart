import 'package:flutter/material.dart';

class CountryInfo extends StatelessWidget {
  final String firstinfo;
  final String firstanswer;
  final String secondinfo;
  final String secondanswer;
  final String thirdinfo;
  final String thirdanswer;
  final String fourthinfo;
  final String fourthanswer;

  const CountryInfo({super.key, required this.firstinfo, required this.firstanswer, required this.secondinfo, required this.secondanswer, required this.thirdinfo, required this.thirdanswer, required this.fourthinfo, required this.fourthanswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(firstinfo,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(width: 4,),
            Text(firstanswer,),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Text(secondinfo,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(width: 4,),
            Text(secondanswer,),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Text(thirdinfo,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(width: 4,),
            Text(thirdanswer,),
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          children: [
            Text(fourthinfo,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(width: 4,),
            Text(fourthanswer,),
          ],
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}