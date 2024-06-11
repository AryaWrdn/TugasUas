import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';

class DetailObat extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const DetailObat({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: AppColors.hijauGelap,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: TextStyles.titleForm.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: TextStyles.body.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
