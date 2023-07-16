import 'package:flutter/material.dart';
import 'package:pet_adoption/models/petmodel.dart';

class CardView extends StatelessWidget {
  final Pet pet;

  const CardView({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Hero(
            tag: pet.id,
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(pet.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pet.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age: ${pet.age}'),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Text(
                    'Price: \$${pet.price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  pet.status
                      ? const Text(
                          'Already Adopted',
                          style: TextStyle(
                            color: Colors.green,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : const Text(""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
