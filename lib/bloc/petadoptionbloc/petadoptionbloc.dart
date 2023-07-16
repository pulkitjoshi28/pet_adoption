import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionstates.dart';
import 'package:pet_adoption/database/petdatabase.dart';
import 'package:pet_adoption/models/petmodel.dart';

class PetAdoptionBloc extends Bloc<PetEvents, PetStates> {
  final int currentPage = 1;
  List<Pet> pets = [];
  final _dbHelper = DBHelper();

  PetAdoptionBloc() : super(PetInitialState()) {
    on<FetchAllPetsEvent>(_onFetchPets);
    on<AdoptPetEvent>(_onAdoptPetEvent);
    on<FetchAdoptedPetListEvent>(_onFetchAdoptedPets);
    on<ClearAdoptionHistory>(_onClearHistoryEvent);
  }

  Future<FutureOr<void>> _onFetchPets(
      FetchAllPetsEvent event, Emitter<PetStates> emit) async {
    try {
      emit(LoadingState());

      pets = await getPetsList();

      emit(PetsLoadedState(pets));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<FutureOr<void>> _onAdoptPetEvent(
      AdoptPetEvent event, Emitter<PetStates> emit) async {
    try {
      await _dbHelper.updatePetStatus(event.petId, 1);
      pets = await getPetsList();

      emit(PetsLoadedState(pets));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<FutureOr<void>> _onFetchAdoptedPets(
      FetchAdoptedPetListEvent event, Emitter<PetStates> emit) async {
    try {
      emit(LoadingState());

      final petData = await _dbHelper.getSortedHistory();
      pets = petData.map((data) {
        return Pet(
          id: data['id'],
          name: data['name'],
          pet: data['pet'],
          age: data['age'],
          price: data['price'],
          image: data['image'],
          about: data['about'],
          status: data['status'] == 1,
        );
      }).toList();

      final adoptedPets = pets.where((pet) => pet.status).toList();

      emit(AdoptedPetsLoadedState(adoptedPets));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<FutureOr<void>> _onClearHistoryEvent(
      ClearAdoptionHistory event, Emitter<PetStates> emit) async {
    try {
      await _dbHelper.updateAllPetsStatus(0);
      pets = await getPetsList();

      emit(PetsLoadedState(pets));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<List<Pet>> getPetsList() async {
    final petData = await _dbHelper.getPets();
    pets = petData.map((data) {
      return Pet(
        id: data['id'],
        name: data['name'],
        pet: data['pet'],
        age: data['age'],
        price: data['price'],
        image: data['image'],
        about: data['about'],
        status: data['status'] == 1,
      );
    }).toList();

    return pets;
  }
}
