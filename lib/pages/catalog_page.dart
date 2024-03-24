import 'package:empat_flutter_week_4/data/data.dart';
import 'package:empat_flutter_week_4/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  User user = AppData.user;
  List<Product> products = AppData.products;

  void onTileTap(BuildContext context, Product product) {
    Navigator.pushNamed(context, '/product-details', arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      addAutomaticKeepAlives: true,
      childAspectRatio: 3 / 5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      crossAxisCount: 2,
      children: products
          .map(
            (product) => GestureDetector(
              onTap: () {
                onTileTap(context, product);
              },
              child: CustomTileWidget(product: product),
            ),
          )
          .toList(),
    );
  }
}
