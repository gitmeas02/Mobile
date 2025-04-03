import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscured = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 180, 218, 250), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 229, 226, 226), width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.5,horizontal: 10.0),
                ),
              ),
            ),
          const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: _isObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(),
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 180, 218, 250), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 229, 226, 226), width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.5,horizontal: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
              ),
            ),
            Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (bool? value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                  },
                  activeColor: Colors.blue,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'By creating an account you agree to our',  
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                        // Add navigation or action for Privacy Policy here
                        },
                        child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {}, // Add login logic here
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
           Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        
      ),
    );
  }
}
