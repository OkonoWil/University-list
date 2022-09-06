import 'package:flutter/material.dart';
import 'package:university_list/data/models/university_model.dart';

class ItemTile extends StatelessWidget {
  final UniversityModel item;
  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.country),
      ),
    );
  }
}
