import 'package:pet_adoption/models/petmodel.dart';

abstract class PetStates {
  List<Pet?> get pets => [];
}

class PetInitialState extends PetStates {}

class LoadingState extends PetStates {}

class ErrorState extends PetStates {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class PetsLoadedState extends PetStates {
  @override
  final List<Pet> pets;

  PetsLoadedState(this.pets);
}

class PetAdoptedState extends PetStates {
  PetAdoptedState();
}

class AdoptedPetsLoadedState extends PetStates {
  final List<Pet> adoptedPets;

  AdoptedPetsLoadedState(this.adoptedPets);
}
