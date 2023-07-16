import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption/themes/themes.dart';
import 'package:pet_adoption/views/homepage/home_page.dart';
import 'package:provider/provider.dart';

import 'bloc/petadoptionbloc/petadoptionbloc.dart';
import 'database/petdatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await insertPetsToDatabase();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PetAdoptionBloc(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: themeProvider.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
