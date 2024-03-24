class Product {
  final int _id;
  final String _name;
  List<String> _sizes = [];
  final double _price;
  final String _imageAsset;
  final String _description =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
  static int counter = 0;

  Product({
    required String name,
    required List<String> sizes,
    required double price,
    required String imageAsset,
  })  : _id = counter++,
        _name = name,
        _sizes = [...sizes],
        _price = price,
        _imageAsset = imageAsset;

  int get id => _id;
  String get name => _name;
  List<String> get sizes => _sizes;
  double get price => _price;
  String get imageAsset => _imageAsset;
  String get description => _description;
}

class User {
  final bool _isAuthorized;
  final String _name;
  final String _surname;
  final String _email;
  final double _balance;
  final String _imageAsset;
  final List<Product> _favourites = [];

  User.singleton({
    required bool isAuthorized,
    required String name,
    required String surname,
    required String email,
    required double balance,
    required String imageAsset,
  })  : _isAuthorized = isAuthorized,
        _name = name,
        _surname = surname,
        _email = email,
        _balance = balance,
        _imageAsset = imageAsset;

  static final User user = User.singleton(
    isAuthorized: true,
    name: 'Dmitry',
    surname: 'Prudnyk',
    email: 'example@gmail.com',
    balance: 3200,
    imageAsset: 'images/men.jpg',
  );

  factory User() {
    return User.user;
  }

  void addToFavourite(Product product) {
    _favourites.add(product);
  }

  void removeFromFavourite(Product product) {
    _favourites.remove(product);
  }

  List<Product> get favourites => _favourites;
  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  double get balance => _balance;
  String get imageAsset => _imageAsset;

}

abstract class AppData {
  static final List<Product> products = [
    Product(
      name: 'T-Shirt',
      sizes: ['XS', 'XM', 'XXS'],
      price: 700,
      imageAsset: 'images/jacket.jpg',
    ),
    Product(
      name: 'Shoes',
      sizes: ['42', '44', '46', '48'],
      price: 1560,
      imageAsset: 'images/shoes.jpg',
    ),
    Product(
      name: 'Pants',
      sizes: ['M', 'L', 'XL'],
      price: 230,
      imageAsset: 'images/pants.jpg',
    ),
    Product(
      name: 'Glasses',
      sizes: ['140', '142'],
      price: 450,
      imageAsset: 'images/glasses.jpg',
    ),
    Product(
      name: 'Gloves',
      sizes: ['39', '40', '41'],
      price: 900,
      imageAsset: 'images/gloves.jpg',
    ),
    Product(
      name: 'Hat',
      sizes: ['48'],
      price: 1020,
      imageAsset: 'images/hat.jpg',
    ),
  ];

  static final User user = User();
}
