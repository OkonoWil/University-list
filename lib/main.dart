import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_list/presentation/university_home_page.dart';
import 'package:university_list/shared/service_locator.dart';
import 'package:university_list/business_logic/university_provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String country = '';
    return ChangeNotifierProvider<UniversityProvider>(
      create: ((context) => getIt.get<UniversityProvider>()
        ..loadItems(country == '' ? 'cameroon' : country)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 238, 186, 109),
          ),
        ),
        home: const UniversityHome(),
      ),
    );
  }
}
