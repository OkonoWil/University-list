import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../business_logic/university_provider.dart';

class UniversityListPage extends StatefulWidget {
  const UniversityListPage({Key? key}) : super(key: key);

  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(child: Consumer<UniversityProvider>(
              builder: (context, value, child) {
                if (value.university == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                var university = value.university;
                return const Text('Ok');
              },
            ))
          ],
        ),
      ),
    );
  }
}
