import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionstates.dart';
import 'package:pet_adoption/models/petmodel.dart';

import 'ListtileView/list_tile.dart';

class HistoryPage extends StatefulWidget {
  final List<Pet> adoptedPets;

  const HistoryPage({Key? key, required this.adoptedPets}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PetAdoptionBloc>(context).add(FetchAdoptedPetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption History'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<PetAdoptionBloc, PetStates>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const CircularProgressIndicator();
            case ErrorState:
              return Text('Error: ${(state as ErrorState).errorMessage}');
            case AdoptedPetsLoadedState:
              final adoptedPets = (state as AdoptedPetsLoadedState).adoptedPets;
              return ListTileView(pets: adoptedPets);
            default:
              return Container();
          }
        },
      ),
    );
  }
}
