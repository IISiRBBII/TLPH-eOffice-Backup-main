import 'package:eOffice/screens/menu.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  String _defaultType = 'Meeting Rooms';

  
  List<Map<String, dynamic>> lUser = [
    {
      'user_id': 001,
      'username': 'admin',
      'type': 'Admin',
      'password': '1234',
      'name': 'Teerathep Yuukaew'
    },
    {
      'user_id': 002,
      'username': 'normal',
      'type': 'User',
      'password': '2234',
      'name': 'Thanawut Banjai'
    }
  ];

  Map<String, dynamic>? _validateLogin(String username, String password) {
    for (var user in lUser) {
      if (user['username'] == username && user['password'] == password) {
        return user; // Return the user data if found
      }
    }
    return null; // Return null if the user is not found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 500,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Tooltip(
                message: 'TL20240220V001',
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 100,
                ),
              ),
              Text(
                'e-Back Office',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 400,
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter User Name',
                    labelText: 'User',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    var user = _validateLogin(
                        _userNameController.text, _passwordController.text);
                    if (user != null) {
                      // Login credentials are valid, navigate to MainMenu with user data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainMenu(
                            meeting: _defaultType,
                            username: user['username'], // ส่ง username
                            type: user['type'],
                            name : user['name'] // ส่ง type
                          ),
                        ),
                      );
                    } else {
                      // Show an error message if login credentials are invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid username or password!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
