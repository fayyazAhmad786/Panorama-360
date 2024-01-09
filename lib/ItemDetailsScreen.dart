import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'ItemDetails.dart';
import 'helper_classes/BillingScreen.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ItemDetails item;

  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E3131), // Background color
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2E3131), // Match background color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageSlider(item.imageSources),
            _buildItemDetails(),
            _buildCheckoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSlider(List<String> imageSources) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 1.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: imageSources.map((imageSource) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageSource),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildItemDetails() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Card(
        color: Color(0xFF2E3131), // Card background color
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Price: ${item.price}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                item.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          _showProceedDialog(context);
        },
        child: Text(
          'Checkout',
          style: TextStyle(fontSize: 20.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  void _showProceedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Proceed to Checkout?'),
          content: Text('Do you want to proceed with the purchase?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToBillingScreen(context); // Navigate to the billing screen
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToBillingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BillingScreen(),
      ),
    );
  }
}
