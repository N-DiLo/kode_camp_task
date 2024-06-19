class AppModel {
  final String imgDir;
  final String title;
  final String price;

  AppModel({required this.imgDir, required this.title, required this.price});

  static List<AppModel> products = [
    AppModel(
      imgDir: 'assets/images/jordan1.jpg',
      title: 'Jordan One',
      price: '300.00',
    ),
    AppModel(
      imgDir: 'assets/images/jordan2.jpg',
      title: 'Jordan Two',
      price: '250.00',
    ),
    AppModel(
        imgDir: 'assets/images/jordan3.jpg',
        title: 'Jordan Three',
        price: '500.00'),
    AppModel(
      imgDir: 'assets/images/jordan4.jpg',
      title: 'Jordan Four',
      price: '420.00',
    ),
    AppModel(
      imgDir: 'assets/images/jordan5.jpg',
      title: 'Jordan Five',
      price: '200.00',
    ),
    AppModel(
      imgDir: 'assets/images/jordan6.jpg',
      title: 'Jordan Six',
      price: '450.00',
    ),
    AppModel(
      imgDir: 'assets/images/jordan4.jpg',
      title: 'Jordan Seven',
      price: '350.00',
    ),
  ];
}
