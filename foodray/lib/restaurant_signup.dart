import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/firebase_service.dart';

class RestaurantSignupPage extends StatefulWidget {
  const RestaurantSignupPage({super.key});

  @override
  _RestaurantSignupPageState createState() => _RestaurantSignupPageState();
}

class _RestaurantSignupPageState extends State<RestaurantSignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _restaurantNameController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      final isValidLicense = await FirebaseService.checkLicense(
        _restaurantNameController.text.trim(),
        _licenseNumberController.text.trim(),
      );

      if (isValidLicense) {
        await FirebaseService.signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          'restaurant',
          {
            'restaurantName': _restaurantNameController.text.trim(),
            'licenseNumber': _licenseNumberController.text.trim(),
            'address': _addressController.text.trim(),
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup Successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid License Number')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _restaurantNameController,
                decoration: const InputDecoration(labelText: 'Restaurant Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _licenseNumberController,
                decoration: const InputDecoration(labelText: 'License Number'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Full Address'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSignup,
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
