import 'package:flutter/material.dart';
import 'library.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool isLoginFailed = false;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    const String correctEmail = 'user@gmail.com';
    const String correctPassword = '123456';

    if (emailController.text.trim() == correctEmail &&
        passwordController.text == correctPassword) {
      
      setState(() {
        isLoginFailed = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LibraryPage(),
        ),
      );
    } else {
      setState(() {
        isLoginFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FB),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),

            child: Column(
              children: [

                // =========================
                // ICON
                // =========================

                Container(
                  width: 85,
                  height: 85,

                  decoration: BoxDecoration(
                    color: const Color(0xFF4A5BC7),
                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color(0xFF4A5BC7)
                                .withOpacity(0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.auto_stories_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'MyLibrary',

                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252525),
                  ),
                ),

                const SizedBox(height: 7),

                const Text(
                  'Your personal book collection',

                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 35),

                // =========================
                // LOGIN CARD
                // =========================

                Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

SizedBox(
  width: double.infinity,
  child: Text(
    'Login to MyLibrary',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFF252525),
    ),
  ),
),

const SizedBox(height: 6),

SizedBox(
  width: double.infinity,
  child: Text(
    'Enter your account to access your book collection',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 13,
      color: Colors.grey,
    ),
  ),
),

                      const SizedBox(height: 25),

                      // EMAIL
                      const Text(
                        'Email',

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: emailController,

                        keyboardType:
                            TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                          ),

                          filled: true,

                          fillColor:
                              const Color(0xFFF7F7FA),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(14),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // PASSWORD
                      const Text(
                        'Password',

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: passwordController,

                        obscureText:
                            !isPasswordVisible,

                        decoration: InputDecoration(
                          hintText: 'Enter your password',

                          prefixIcon: const Icon(
                            Icons.lock_outline,
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible =
                                    !isPasswordVisible;
                              });
                            },

                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                            ),
                          ),

                          filled: true,

                          fillColor:
                              const Color(0xFFF7F7FA),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(14),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      // ERROR
                      if (isLoginFailed) ...[
                        const SizedBox(height: 15),

                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEEEE),
                            borderRadius:
                                BorderRadius.circular(12),
                          ),

                          child: const Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 20,
                              ),

                              SizedBox(width: 8),

                              Expanded(
                                child: Text(
                                  'Email atau password salah.',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 25),

                      // LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 54,

                        child: ElevatedButton(
                          onPressed: login,

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF4A5BC7),

                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15),
                            ),
                          ),

                          child: const Text(
                            'LOGIN',

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'Library Management App',

                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}