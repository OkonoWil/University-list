import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business_logic/university_provider.dart';
import 'package:university_list/presentation/widgets/item_tile.dart';

class UniversityListPage extends StatelessWidget {
  const UniversityListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Expanded(child: Consumer<UniversityProvider>(
            builder: (context, value, child) {
              if (value.university == null) {
                return const Center(child: CircularProgressIndicator());
              }
              var university = value.university!;
              return ListView.builder(
                itemCount: university.length,
                itemBuilder: (context, index) {
                  var item = university[index];
                  return ItemTile(item: item);
                },
              );
            },
          ))),
    );
  }
}
