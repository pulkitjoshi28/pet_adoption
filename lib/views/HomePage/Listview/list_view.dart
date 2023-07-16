import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
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
        if (index == pets.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: () {
                BlocProvider.of<PetAdoptionBloc>(context).add(FetchAllPetsEvent());
              },
              child: const Text('Load More'),
            ),
          );
        }
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
