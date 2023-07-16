import 'package:flutter/material.dart';
import 'package:pet_adoption/models/petmodel.dart';

class ListTileView extends StatelessWidget {
  final List<Pet> pets;

  const ListTileView({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        if (pets.isEmpty) {
          return Center(
              child: Text(
            "No Pet Adopted",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ));
        } else {
          Pet pet = pets[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(pet.image)),
            title: Text(pet.name),
            subtitle: Text('Age: ${pet.age} - Price: \$${pet.price.toString()}'),
            trailing: const Icon(Icons.check, color: Colors.green),
          );
        }
      },
    );
  }
}
