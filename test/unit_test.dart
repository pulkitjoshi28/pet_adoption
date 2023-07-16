import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionstates.dart';
import 'package:pet_adoption/models/petmodel.dart';

void main() {
  group('Pet Model', () {
    test('Pet object should be created correctly', () {
      // Arrange
      const petId = '1';
      const petName = 'Charlie';
      const petAge = 3;
      const pet = 'Cat';
      const petPrice = 100;
      const petImage = 'https://example.com/image.jpg';
      const about = "About";
      const petStatus = false;

      // Act
      final petData = Pet(
        id: petId,
        name: petName,
        age: petAge,
        price: petPrice.toString(),
        image: petImage,
        about: about,
        status: petStatus,
        pet: pet,
      );

      // Assert
      expect(petData.id, equals(petId));
      expect(petData.name, equals(petName));
      expect(petData.age, equals(petAge));
      expect(petData.price, equals(petPrice));
      expect(petData.image, equals(petImage));
      expect(petData.status, equals(petStatus));
    });
  });

  group('PetAdoptionBloc', () {
    test('Fetch pets and check state', () async {
      final petBloc = PetAdoptionBloc();

      petBloc.add(FetchAllPetsEvent());

      await expectLater(
        petBloc.stream,
        emits(isA<PetsLoadedState>()),
      );

      expect(petBloc.state.pets.isNotEmpty, true);
    });

    test('Adopt a pet and check state', () async {
      final petBloc = PetAdoptionBloc();

      petBloc.add(FetchAllPetsEvent());
      await expectLater(
        petBloc.stream,
        emits(isA<PetsLoadedState>()),
      );

      final firstPetId = petBloc.state.pets.first?.id;

      petBloc.add(AdoptPetEvent(firstPetId!));

      await expectLater(
        petBloc.stream,
        emits(isA<PetsLoadedState>()),
      );

      final adoptedPet = petBloc.state.pets.firstWhere((pet) => pet?.id == firstPetId);
      expect(adoptedPet?.status, true);
    });
  });
}
