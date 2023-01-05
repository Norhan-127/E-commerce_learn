import 'package:e_commerce/utilities/enums.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/pages/home_page.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthFormType.login ? 'Login' : 'Register',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    autofocus: true,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your email' : null,
                    //the button validate it
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your password' : null,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_authType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text('Forgot your password?'),
                        onTap: () {},
                      ),
                    ),
                  const SizedBox(
                    height: 24,
                  ),
                  MainButton(
                      text: _authType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                      onTap: () {
                        //condition to validate the text form field
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, AppRoutes.homePageRoute);
                        }
                      }),
                  const SizedBox(
                    height: 16, 
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(_authType == AuthFormType.login
                          ? 'Don\'t have an account? Register'
                          : 'Have an account? Login'),
                      onTap: () {
                        setState(() {
                          if (_authType == AuthFormType.login) {
                            _authType = AuthFormType.register;
                          } else {
                            _authType = AuthFormType.login;
                          }
                          _emailController.clear();
                          _passwordController.clear();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        _authType == AuthFormType.login
                            ? 'Or login with'
                            : 'Or register with',
                        style: Theme.of(context).textTheme.subtitle1,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
