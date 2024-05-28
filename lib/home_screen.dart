import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/style.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {},
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: AppColors.putihCerah,
        color: AppColors.hijauGelap,
        items: const [
          Icon(
            Icons.dehaze,
            color: AppColors.putihCerah,
          ),
          Icon(
            Icons.access_alarm,
            color: AppColors.putihCerah,
          ),
          Icon(
            Icons.settings,
            color: AppColors.putihCerah,
          ),
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 221,
              width: double.infinity,
              color: const Color.fromARGB(255, 245, 247, 247),
              child: Image.asset(
                "assets/images/appbar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 30,
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 150,
                      height: 140,
                      child: Text("Selamat\nDatang",
                          style: TextStyles.titleApp
                              .copyWith(color: AppColors.putihCerah)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 30,
            bottom: 0,
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Obat Hari Ini",
                      style: TextStyles.titleForm,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
