import 'package:flutter/material.dart';
import 'package:pet_adoption/models/petmodel.dart';
import 'package:pet_adoption/views/detailspage/details_page.dart';
import 'package:pet_adoption/views/homepage/card/card.dart';

class CustomListView extends StatelessWidget {
  final List<Pet> pets;

  const CustomListView({
    Key? key,
    required this.pets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pets.length + 1, // +1 for the button
      itemBuilder: (context, index) {
        final pet = pets[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(pet: pet),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: CardView(pet: pet),
          ),
        );
      },
    );
  }
}
