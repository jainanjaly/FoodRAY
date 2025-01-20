import 'package:flutter/material.dart';
import 'restaurant_signup.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RestaurantSignupPage(),
                  ),
                );
              },
              child: const Text('I am a Restaurant'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // NGO signup functionality will be added later
              },
              child: const Text('I am an NGO'),
            ),
          ],
        ),
      ),
    );
  }
}
