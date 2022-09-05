import 'package:flutter/material.dart';
import 'package:university_list/presentation/screens/university_list_page.dart';

class UniversityHome extends StatefulWidget {
  const UniversityHome({Key? key}) : super(key: key);

  @override
  State<UniversityHome> createState() => _UniversityHomeState();
}

class _UniversityHomeState extends State<UniversityHome>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'University List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color.fromARGB(255, 255, 153, 0),
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(
              text: 'Cameroon',
            ),
            Tab(
              text: 'Orther',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UniversityListPage(),
          UniversityListPage(),
        ],
      ),
    );
  }
}
