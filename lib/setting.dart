import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';
import 'package:flutter/widgets.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 221,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 245, 247, 247),
                child: Image.asset(
                  "assets/images/appbar.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 30,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 140,
                        child: Text("Setting",
                            style: TextStyles.titleApp
                                .copyWith(color: AppColors.putihCerah)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: 30,
              right: 30,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan",
                    style: TextStyles.titleForm,
                  ),
                  SizedBox(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    child: const Divider(
                        thickness: 2, color: AppColors.hijauGelap),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Card(
                          color: AppColors.hijauGelap,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                trailing: const Icon(
                                  Icons.settings,
                                  color: AppColors.putihCerah,
                                ),
                                title: Text(
                                  'Ubah Profil',
                                  style: TextStyles.title
                                      .copyWith(color: AppColors.putihCerah),
                                ),
                                subtitle: Text('Atur profil Anda',
                                    style: TextStyles.body
                                        .copyWith(color: AppColors.putihCerah)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Card(
                          color: AppColors.hijauGelap,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                trailing: const Icon(
                                  Icons.security,
                                  color: AppColors.putihCerah,
                                ),
                                title: Text(
                                  'Keamanan',
                                  style: TextStyles.title
                                      .copyWith(color: AppColors.putihCerah),
                                ),
                                subtitle: Text('Pengaturan keamanan',
                                    style: TextStyles.body
                                        .copyWith(color: AppColors.putihCerah)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
