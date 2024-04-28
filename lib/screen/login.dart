import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/auth_provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authprovider=Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text('Login')),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText:  'Email',
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),

            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                authprovider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: authprovider.loading ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : const Center(child: Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
