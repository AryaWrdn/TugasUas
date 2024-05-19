import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_uas/style.dart';
import 'package:project_uas/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final paswordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.hijauGelap,
        title: Text('Login', style: TextStyles.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/gambar.png',
                    width: 182.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 7),
                  child: Divider(thickness: 3, color: AppColors.hijauGelap),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 32),
                  child: Text('Atur Jadwal Minum Obat\nHanya Dalam Genggaman'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Masuk',
                  style: TextStyles.title.copyWith(fontSize: 28.0),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            hint: 'Username,Email,No.telp'),
                        const SizedBox(
                          height: 16.0,
                        ),
                        CustomTextField(
                          controller: paswordControler,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          hint: 'Password',
                          isObscure: isObscure,
                          haSuffix: true,
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        )
                      ],
                    )),
                const SizedBox(
                  height: 8.0,
                ),
                Text('Forget your pasword?', style: TextStyles.body),
                const SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Login',
                        style: TextStyles.title.copyWith(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Don\'t have a account?',
                  style: TextStyles.body.copyWith(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Sign up',
                  style: TextStyles.body.copyWith(
                    fontSize: 18.0,
                    color: AppColors.darkBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
