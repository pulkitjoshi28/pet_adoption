import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionstates.dart';
import 'package:pet_adoption/models/petmodel.dart';
import 'package:pet_adoption/views/homepage/drawer/drawer.dart';
import 'package:pet_adoption/views/homepage/listview/list_view.dart';

import 'Searchbar/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  List<Pet> filteredPets = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PetAdoptionBloc>(context).add(FetchAllPetsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(child: CustomDrawer(pets: filteredPets)),
      body: Column(
        children: [
          SearchBar(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
                filteredPets = _filterPets(value);
              });
            },
          ),
          Expanded(
            child: BlocBuilder<PetAdoptionBloc, PetStates>(
              buildWhen: (_, state) => (state is PetsLoadedState),
              builder: (context, state) {
                switch (state.runtimeType) {
                  case LoadingState:
                    return const CircularProgressIndicator();
                  case ErrorState:
                    return Text('Error: ${(state as ErrorState).errorMessage}');
                  case PetsLoadedState:
                    final pets = searchQuery.isEmpty
                        ? (state as PetsLoadedState).pets
                        : filteredPets;
                    return CustomListView(pets: pets);
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Pet> _filterPets(String query) {
    return BlocProvider.of<PetAdoptionBloc>(context).pets.where((pet) {
      final nameLower = pet.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
