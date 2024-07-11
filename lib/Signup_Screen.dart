import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Variables to track password strength criteria
  bool _hasNumber = false;
  bool _hasLetter = false;
  bool _hasUppercase = false;
  bool _hasSymbol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.shade700,
                Colors.white,
                Colors.white,
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Logo
                Container(
                  padding: const EdgeInsets.only(top: 120),
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/tabaani.jpg', // Replace with your logo's asset path
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: _updatePasswordStrength,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.0), // Space for password strength indicator
                _buildPasswordStrengthIndicator(), // Display password strength indicator
                SizedBox(height: 8.0), // Additional space for layout
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Sign up logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Signing Up')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18.0),
                    ),
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 16.0), // Space below the sign-up button
                TextButton(
                  onPressed: () {
                    // Navigate to sign-in screen or perform other actions
                  },
                  child: Text(
                    'Already have an account? Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to update password strength indicators
  void _updatePasswordStrength(String value) {
    setState(() {
      _hasNumber = value.contains(RegExp(r'\d'));
      _hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasSymbol = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  // Widget to build the password strength indicator
  Widget _buildPasswordStrengthIndicator() {
    double strength = 0.0;
    if (_hasNumber) strength += 0.25;
    if (_hasLetter) strength += 0.3;
    if (_hasUppercase) strength += 0.25;
    if (_hasSymbol) strength += 0.2;

    Color indicatorColor;
    if (strength < 0.5) {
      indicatorColor = Colors.red;
    } else if (strength < 0.75) {
      indicatorColor = Colors.orange;
    } else {
      indicatorColor = Colors.green;
    }

    return Container(
      height: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}
