abstract class PetEvents {}

class FetchAllPetsEvent extends PetEvents {}

class AdoptPetEvent extends PetEvents {
  final String petId;

  AdoptPetEvent(this.petId);
}

class ClearAdoptionHistory extends PetEvents {}

class FetchAdoptedPetListEvent extends PetEvents {}

class FetchNextPageEvent extends PetEvents {}
