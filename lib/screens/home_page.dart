import 'package:carousel_slider/carousel_slider.dart';
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Expanded(
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    childAspectRatio: (300 / 420), // (width / height)

                    // Generate 100 widgets that display their index in the List.
                    children: const [
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
