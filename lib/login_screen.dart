import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Pharalert/home_screen.dart';
import 'package:Pharalert/register_screen.dart';
import 'package:Pharalert/style.dart';
import 'package:Pharalert/widget/custom_textfield.dart';

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
            const Padding(
              padding: EdgeInsets.only(left: 32, top: 7),
              child: Divider(thickness: 3, color: AppColors.hijauGelap),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 32),
              child: Text('Atur Jadwal Minum Obat\nHanya Dalam Genggaman',
                  style: TextStyles.warna),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'Masuk',
              style: TextStyles.titleForm,
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
                      hint: 'Username,Email,No.telp',
                      haSuffix: true,
                      icon: Icons.person,
                    ),
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
              height: 16.0,
            ),
            Text('lupa pasword?',
                style: TextStyles.body.copyWith(color: AppColors.hijauGelap)),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: SizedBox(
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyles.title.copyWith(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              'Belum ada akun ?',
              style: TextStyles.body
                  .copyWith(fontSize: 18.0)
                  .copyWith(color: AppColors.hijauGelap),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                },
                child: SizedBox(
                  width: 320,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyles.title.copyWith(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 6.0,
            ),
          ],
        ),
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(88, 54),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.hijauGelap,
    padding: const EdgeInsets.symmetric(horizontal: 27),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(27)),
    ),
  );
}
