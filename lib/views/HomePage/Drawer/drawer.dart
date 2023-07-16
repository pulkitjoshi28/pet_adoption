import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionbloc.dart';
import 'package:pet_adoption/bloc/petadoptionbloc/petadoptionevents.dart';
import 'package:pet_adoption/models/petmodel.dart';
import 'package:pet_adoption/themes/themes.dart';
import 'package:pet_adoption/views/historypage/history_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  final List<Pet> pets;

  const CustomDrawer({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/12250671/pexels-photo-12250671.jpeg?auto=compress&cs=tinysrgb&w=800",
            ),
            radius: 40.0,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('History Page'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryPage(
                  adoptedPets: pets,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('Change Theme'),
          onTap: () => {
            Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode(),
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Clear Adoption History'),
          onTap: () => {
            Fluttertoast.showToast(
              msg: 'Adoption History was cleared !',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.grey[800],
              textColor: Colors.green,
            ),
            BlocProvider.of<PetAdoptionBloc>(context).add(ClearAdoptionHistory())
          },
        ),
      ],
    );
  }
}
