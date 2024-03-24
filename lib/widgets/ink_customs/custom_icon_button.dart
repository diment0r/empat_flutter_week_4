import 'package:empat_flutter_week_4/data/data.dart';
import 'package:empat_flutter_week_4/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final Product _product;
  final User user = AppData.user;

  CustomIconButton({super.key, required Product product}) : _product = product;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with AutomaticKeepAliveClientMixin<CustomIconButton> {
  Color likedIconColor = CColors.dark;

  void onIconTap() {
    setState(() {
      if (likedIconColor == CColors.dark) {
        likedIconColor = CColors.red;
        widget.user.addToFavourite(widget._product);
      } else {
        likedIconColor = CColors.dark;
        widget.user.removeFromFavourite(widget._product);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(8),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: CColors.light.withOpacity(1.0),
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onIconTap,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Ink(
            child: Icon(Icons.favorite, size: 20, color: likedIconColor),
          ),
        ),
      ),
    );
  }
}

