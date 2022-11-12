import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final String name;
  final String capital;
  final String image;
  void Function()? onTap;

  CountryTile({super.key, required this.name, required this.capital, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(image))
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(name),
        ),
        subtitle: Text(capital),
      ),
    );
  }
}
