import 'package:empat_flutter_week_4/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        color: CColors.dark,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 0,
                    child: Icon(Icons.add_shopping_cart, color: CColors.light)),
                Text(
                  'Add to basket',
                  style: TextStyle(
                    color: CColors.light,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
