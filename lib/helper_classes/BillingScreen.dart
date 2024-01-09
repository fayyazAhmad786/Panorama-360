import 'package:flutter/material.dart';

class BillingScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Information'),
      ),
      body: SingleChildScrollView(child:   Container(
        padding: EdgeInsets.all(16.0),
        color: Color(0xFF1E2A38), // Background color
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Billing Information',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              _buildFormField(
                controller: _nameController,
                label: 'Name',
                hintText: 'John Doe',
                icon: Icons.person,
              ),
              _buildFormField(
                controller: _addressController,
                label: 'Address',
                hintText: '123 Main St, City, Country',
                icon: Icons.location_on,
              ),
              _buildFormField(
                controller: _cardNumberController,
                label: 'Card Number',
                hintText: '**** **** **** ****',
                icon: Icons.credit_card,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      controller: _expirationDateController,
                      label: 'Expiration Date',
                      hintText: 'MM/YY',
                      icon: Icons.calendar_today,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: _buildFormField(
                      controller: _cvvController,
                      label: 'CVV',
                      hintText: '123',
                      icon: Icons.lock,
                    ),
                  ),
                ],
              ),
              _buildFormField(
                controller: _emailController,
                label: 'Email',
                hintText: 'johndoe@example.com',
                icon: Icons.email,
              ),
              _buildFormField(
                controller: _phoneNumberController,
                label: 'Phone Number',
                hintText: '123-456-7890',
                icon: Icons.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _processPayment();
                  }
                },
                child: Text('Confirm Purchase'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF00A7E1), // Button color
                  padding: EdgeInsets.all(16.0),
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

        ),
      ))

    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
  }) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child:TextFormField(
          controller: controller,
          style: TextStyle(color: Colors.white), // Text color
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: Color(0xFF00A7E1), // Icon color
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), // Border color
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF00A7E1)), // Focused border color
            ),
            labelStyle: TextStyle(
              color: Colors.white, // Label color
            ),
            hintStyle: TextStyle(
              color: Color(0xFF6E7E91), // Hint text color
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),

    );
  }

  void _processPayment() {
    // Implement payment processing logic here
    // You can access the entered information using the controller values
    // e.g., _nameController.text, _addressController.text, etc.
    // Display a success or error message to the user based on the payment result.
  }
}
