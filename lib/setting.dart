import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';
import 'package:Pharalert/widget/custom_textfield.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  String userName = 'Nama Pengguna';
  String userEmail = 'email@domain.com';
  String userAge = '25';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 650,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.hijauGelap,
                      AppColors.hijauGelap.withOpacity(1.0),
                      AppColors.hijauGelap.withOpacity(0.8),
                      AppColors.hijauGelap.withOpacity(0.6),
                      AppColors.hijauGelap.withOpacity(0.0),
                    ],
                    stops: const [0.0, 0.29, 0.5, 0.67, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/logo.png'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            userName,
                            style: TextStyles.title
                                .copyWith(color: AppColors.hijauGelap),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            userEmail,
                            style: TextStyles.body
                                .copyWith(color: AppColors.hijauGelap),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Usia: $userAge',
                            style: TextStyles.body
                                .copyWith(color: AppColors.hijauGelap),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _nameController.text = userName;
                      _emailController.text = userEmail;
                      _ageController.text = userAge;

                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                            ),
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      controller: _nameController,
                                      textInputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      hint: 'Nama',
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      controller: _emailController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      hint: 'Email',
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      controller: _ageController,
                                      textInputType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      hint: 'Usia',
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            userName = _nameController.text;
                                            userEmail = _emailController.text;
                                            userAge = _ageController.text;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Simpan'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: raisedButtonStyle,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text(
                        'Edit Profil',
                        style: TextStyles.title
                            .copyWith(color: AppColors.putihCerah),
                      ),
                    ),
                  ),
                ],
              ),
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
    padding: const EdgeInsets.symmetric(horizontal: 100),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(27)),
    ),
  );
}
