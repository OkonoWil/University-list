import 'package:flutter/material.dart';
import 'package:university_list/data/models/university_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemTile extends StatelessWidget {
  final UniversityModel item;
  const ItemTile({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.country),
            Row(
              children: [
                const Text('Web page: '),
                const Padding(padding: const EdgeInsets.all(8)),
                Text(item.webPages.isNotEmpty
                    ? item.webPages.first!
                    : 'no web page'),
              ],
            ),
          ],
        ),
        onTap: _launchUrl,
      ),
    );
  }

  void _launchUrl() async {
    final Uri url = Uri.parse(item.webPages.first!);
    if (item.webPages.isNotEmpty) {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }
}
