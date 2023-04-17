import 'dart:io';

import 'package:baitap_ui/screen_size.dart';
import 'package:baitap_ui/widget/custom_button.dart';
import 'package:baitap_ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../widget/yellow_background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _phonenumberController = TextEditingController();
  String _phonenumber = '';
  final _emailController = TextEditingController();
  String _email = '';
  bool _emailValid = true;
  final _usernameController = TextEditingController();
  String _username = '';
  bool _usernameValid = true;
  final _passwordController = TextEditingController();
  String _password = '';
  bool _passwordValid = true;
  final _confirmPasswordController = TextEditingController();
  String _confirmPassword = '';
  bool _agreeTerm = false;
  File? _image;
  bool _obscureText = true;

  bool validateEmail(String email) {
    const String regex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final RegExp regExp = RegExp(regex);
    return regExp.hasMatch(email);
  }

  bool validatePassword(String password) {
    RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
    return regex.hasMatch(password);
  }

  bool validateUsername(String username) {
    return username.length > 6;
  }

  void showImagePicker() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        context: context,
        builder: (context) {
          return SafeArea(
              child: Container(
            height: ScreenSize().screenHeight * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset('assets/images/choose_gallery.svg'),
                ),
                IconButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset('assets/images/choose_camera.svg'),
                ),
              ],
            ),
          ));
        });
  }

  void onSignUpButtonPressed() {
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      message: 'Loading...',
    );
    progressDialog.show();
    Future.delayed(const Duration(seconds: 2), () {
      progressDialog.hide();
      Navigator.of(context).pushNamed('/login', arguments: [_email, _password]);
    });
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final String? message =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (message != null && _emailController.text.isEmpty) {
      _emailController.text = message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: YellowBackground(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text(
                  'Register  ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              controller: _phonenumberController,
                              labelText: 'Phone Number',
                              hintText: 'Phone Number',
                              maxlength: 10,
                              onChanged: (value) {
                                setState(() {
                                  _phonenumber = value;
                                });
                              },
                              icon: const Icon(Icons.phone_android_outlined)),
                          Container(
                            width: 55,
                            height: 55,
                            margin: const EdgeInsets.only(left: 45),
                            decoration: const BoxDecoration(),
                            child: _image != null
                                ? ClipOval(
                                    child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ))
                                : IconButton(
                                    onPressed: showImagePicker,
                                    icon: SvgPicture.asset(
                                        'assets/images/add_image.svg')),
                          )
                        ],
                      ),
                      CustomTextField(
                        errorText: _emailValid ? null : 'Invalid email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Email',
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                            _emailValid = validateEmail(_email);
                          });
                        },
                        icon: const Icon(Icons.person),
                      ),
                      CustomTextField(
                        errorText: _usernameValid ? null : 'Invalid username',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: _usernameController,
                        labelText: 'Username',
                        hintText: 'Username',
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                            _usernameValid = validateUsername(_username);
                          });
                        },
                        icon: const Icon(Icons.person),
                      ),
                      CustomTextField(
                          errorText: _passwordValid ? null : 'Invalid password',
                          showPassword: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          controller: _passwordController,
                          labelText: 'Password',
                          hintText: 'Password',
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                              _passwordValid = validatePassword(_password);
                            });
                          },
                          icon: _obscureText
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined)),
                      CustomTextField(
                          errorText:
                              _confirmPassword == _password ? null : 'Not match',
                          showPassword: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          controller: _confirmPasswordController,
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password',
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                          },
                          icon: _obscureText
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined)),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: _agreeTerm,
                                onChanged: (value) {
                                  setState(() {
                                    _agreeTerm = !_agreeTerm;
                                  });
                                }),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'term of use',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFFB900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      CustomButton(
                          enable: _emailValid &&
                              _usernameValid &&
                              _passwordValid &&
                              _confirmPassword == _password &&
                              _email.isNotEmpty &&
                              _password.isNotEmpty &&
                              _agreeTerm,
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)
                          ), onTap: onSignUpButtonPressed),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
