import 'package:empat_flutter_week_4/data/data.dart';
import 'package:empat_flutter_week_4/utils/colors.dart';
import 'package:empat_flutter_week_4/widgets/ink_customs/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenWidget extends StatefulWidget {
  const ProductDetailsScreenWidget({super.key});

  @override
  State<ProductDetailsScreenWidget> createState() =>
      _ProductDetailsScreenWidgetState();
}

class _ProductDetailsScreenWidgetState
    extends State<ProductDetailsScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final Product product =
        (ModalRoute.of(context)?.settings.arguments) as Product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColors.dark,
        foregroundColor: CColors.light,
        title: Text(product.name),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CColors.dark,
        foregroundColor: CColors.light,
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'Dash${product.id}',
              child: Image.asset(product.imageAsset),
            ),
            DetailsBodyWidget(product: product),
          ],
        ),
      ),
    );
  }
}

class DetailsBodyWidget extends StatelessWidget {
  final Product product;
  const DetailsBodyWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(product.sizes.toString()),
                  ],
                ),
                Text(
                  '${product.price}0 UAH',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const CustomButtonWidget(),
          const SizedBox(height: 20),
          Text(
            product.description,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
