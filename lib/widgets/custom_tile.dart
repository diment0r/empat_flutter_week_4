import 'package:empat_flutter_week_4/data/data.dart';
import 'package:empat_flutter_week_4/widgets/ink_customs/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomTileWidget extends StatefulWidget {
  final Product _product;
  const CustomTileWidget({super.key, required Product product})
      : _product = product;

  @override
  State<CustomTileWidget> createState() => _CustomTileWidgetState();
}

class _CustomTileWidgetState extends State<CustomTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TileImageWidget(product: widget._product),
        TileFooterWidget(
          product: widget._product,
        ),
      ],
    );
  }
}

class TileImageWidget extends StatelessWidget {
  final Product product;
  const TileImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Hero(
            tag: 'Dash${product.id}',
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(product.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CustomIconButton(
              product: product,
            ),
          ),
        ],
      ),
    );
  }
}

class TileFooterWidget extends StatelessWidget {
  final Product product;
  const TileFooterWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          product.name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          product.sizes.toString(),
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Text(
          '${product.price}0 UAH',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
