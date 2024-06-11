import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:Pharalert/beranda.dart';
import 'package:Pharalert/setting.dart';
import 'package:Pharalert/style.dart';
import 'home_content.dart';
import 'home_bloc.dart'; // Impor BLoC

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBarWidget(),
        body: SafeArea(child: HomeContentWidget()),
      ),
    );
  }
}

class CurvedNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) {
        BlocProvider.of<HomeBloc>(context).add(SelectPageEvent(index));
      },
      animationDuration: const Duration(milliseconds: 200),
      backgroundColor: AppColors.putihCerah,
      color: AppColors.hijauGelap,
      items: const [
        Icon(Icons.dehaze, color: AppColors.putihCerah),
        Icon(Icons.access_alarm, color: AppColors.putihCerah),
        Icon(Icons.settings, color: AppColors.putihCerah),
      ],
    );
  }
}

class HomeContentWidget extends StatelessWidget {
  final List<Widget> _pages = [
    const Beranda(),
    const HomeContent(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return IndexedStack(
          index: state.selectedIndex,
          children: _pages,
        );
      },
    );
  }
}
