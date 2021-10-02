import 'package:first_application/factory/factory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:first_application/components/components.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      drawer: const HomeDrawer(),
      body: HomeBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Food',
              style: Theme.of(context).textTheme.headline4?.merge(
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            Text(
              'For You Today',
              style: Theme.of(context).textTheme.headline4,
            ),
            const HomeSearch(),
            HomeCarousel(),
            Container(
              height: 30,
              margin: const EdgeInsets.only(bottom: 5),
              child: ListView.builder(
                itemCount: 30,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => FilterButton(
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                  selected: _selectedCategory == index,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const ScrollPhysics(),
              childAspectRatio: (300 / 460), // (width / height)
              children: ProductFactory()
                  .generateFakeList(length: 20)
                  .map((item) => ProductCard(item: item))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
