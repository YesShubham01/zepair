import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zepair/utils/constants/colors.dart';
import 'package:zepair/utils/custom%20widgets/custom_text.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var dimensions = MediaQuery.sizeOf(context);
    double w = dimensions.width;
    double h = dimensions.height;
    return InkWell(
      onTap: () {
        showSearch(
            context: context, delegate: CustomSearchDelegate(h: h, w: w));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: CustomColors.containerBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.search, color: Colors.orange),
            ),
            CustomText(
                text: 'Search "Services"',
                size: 18,
                color: Colors.black54,
                fontFamily: FontType.balooBhai2),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String?> {
  final List<String> searchItems = [
    "AC Repair",
    "Washing Machine Repair",
    "TV Repair",
    "Geyser Repair",
    "Inverter Service",
    "Fridge Maintenance"
  ];

  final double w;
  final double h;
  CustomSearchDelegate({required this.w, required this.h});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = searchItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = query.isEmpty
        ? []
        : searchItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    if (suggestions.isEmpty) {
      return Center(
        child: Lottie.asset("assets/lotties/search_animation.json",
            width: w * 0.8, repeat: true, fit: BoxFit.cover),
      );
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
