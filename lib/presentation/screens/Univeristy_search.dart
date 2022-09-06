import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_list/presentation/widgets/item_tile.dart';
import 'package:university_list/business_logic/university_provider.dart';
import 'package:university_list/shared/service_locator.dart';

const List<String> items = <String>[
  'United States',
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Angola',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belgium',
  'Belize',
  'Benin',
  'Bermuda',
  'Bhutan',
  'Bosnia and Herzegovina',
  'Botswana',
  'Brazil',
  'Brunei Darussalam',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Cayaman Islands',
  'Chile',
  'China',
  'Colombia',
  'Costa Rica',
  'Czech Republic',
  'Denmark',
  'Dominica',
  'Dominican Republic',
  'Ethiopia',
  'Faroe Islands',
  'Fiji',
  'France',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Greece',
  'Greenland',
  'Grenada',
  'Guadeloupe',
  'Guam',
  'Guatemala',
  'Guinea',
  'Guyana',
  'Haiti',
  'Honduras',
  'Hungary',
  'Iceland'
      'India',
  'Myanmar',
];

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List<DropdownMenuItem<String>>? listCountry = [];

  String? def;

  void generateList() {
    listCountry!.clear();
    for (var element in items) {
      listCountry!.add(
        DropdownMenuItem(
          value: element,
          child: Text(
            element,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    generateList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Center(
            child: Form(
              key: _dropdownFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButtonFormField(
                    hint: const Text(
                      'Select a country',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.orangeAccent),
                    dropdownColor: Colors.orangeAccent,
                    value: def,
                    items: listCountry,
                    onChanged: (String? value) {
                      setState(() {
                        def = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_dropdownFormKey.currentState!.validate() &&
                          def != null) {
                        getIt.get<UniversityProvider>().loadItems2(def!);
                      }
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Submit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5),
        ),
        Expanded(child: Consumer<UniversityProvider>(
            builder: (context, universityProvider, child) {
          if (universityProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (universityProvider.universityList == null) {
            return const Center(
              child: Text("Select a country"),
            );
          } else {
            var university = universityProvider.universityList!;
            return ListView.builder(
              itemCount: university.length,
              itemBuilder: (context, index) {
                var item = university[index];
                return ItemTile(item: item);
              },
            );
          }
        }))
      ],
    );
  }
}
