import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 45,
                top: 140,
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  children: [
                    const TextField(
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Colors.black12,
                        filled: true,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        fillColor: Colors.black12,
                        filled: true,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.black12,
                        filled: true,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TextField(
                      obscureText: true,
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.black12,
                        filled: true,
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(135, 206, 235, 1),
                          fixedSize: const Size(350, 50),
                        ),
                        child: Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'continue_page',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(350, 50),
                        ),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                'assets/images/google.png',
                              ),
                              height: 25,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'continue_page',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(350, 50),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.facebook_rounded,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
