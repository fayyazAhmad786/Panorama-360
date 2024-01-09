import 'package:flutter/material.dart';

import 'ItemDetails.dart';
import 'ItemDetailsScreen.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          _buildItemList(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Shopping Cart',
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    final item1Images = [
      'assets/item1_image1.jpg',
      'assets/item1_image2.jpg',
      'assets/item1_image3.jpg',
      'assets/item1_image4.jpg',
    ];

    final item2Images = [
      'assets/item2_image1.jpg',
      'assets/item2_image2.jpg',
      'assets/item2_image3.jpg',
      'assets/item2_image4.jpg',
    ];
    final item3Images = [
      'assets/item3_image1.jpg',
      'assets/item3_image2.jpg',
      'assets/item3_image3.jpg',
      'assets/item3_image4.jpg',
    ];
    // final item4Images = [
    //   'assets/item1_image1.jpg',
    //   'assets/item1_image2.jpg',
    //   'assets/item1_image3.jpg',
    //   'assets/item1_image4.jpg',
    // ];
    //
    // final item5Images = [
    //   'assets/item2_image1.jpg',
    //   'assets/item2_image2.jpg',
    //   'assets/item2_image3.jpg',
    //   'assets/item2_image4.jpg',
    // ];
    // final item6Images = [
    //   'assets/item3_image1.jpg',
    //   'assets/item3_image2.jpg',
    //   'assets/item3_image3.jpg',
    //   'assets/item3_image4.jpg',
    // ];
    // final item4Images = [
    //   'assets/item2_image1.jpg',
    //   'assets/item2_image2.jpg',
    //   'assets/item2_image3.jpg',
    //   'assets/item2_image4.jpg',
    // ];

    // Add similar lists for other items

    return Expanded(
      child: ListView(
        children: [
          _buildItem(context, 'Shoes', '\$1000.00', 'Description for Shoes', item1Images),
          _buildItem(context, 'Clothes', '\$1500.00', 'Description for Clothes', item2Images),
          _buildItem(context, 'Jackets', '\$700.00', 'Description for Jackets', item3Images),
          _buildItem(context, 'Shoes', '\$1000.00', 'Description for Shoes', item1Images),
          _buildItem(context, 'Clothes', '\$1500.00', 'Description for Clothes', item2Images),
          _buildItem(context, 'Jackets', '\$700.00', 'Description for Jackets', item3Images),
          // Add similar calls for other items
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, String name, String price, String description, List<String> imageSources) {
    return ListTile(
      title: Text(name),
      subtitle: Text('Price: $price'),
      leading: Image.asset(imageSources[0]), // Display the first image as a thumbnail
      onTap: () {
        final itemDetails = ItemDetails(name: name, price: price, description: description, imageSources: imageSources);
        _showItemDetails(context, itemDetails);
      },
    );
  }

  void _showItemDetails(BuildContext context, ItemDetails item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsScreen(item: item),
      ),
    );
  }
}
