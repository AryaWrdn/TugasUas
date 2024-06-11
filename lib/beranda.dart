import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';
import 'package:Pharalert/detail_obat.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> medicines = [
      {
        'name': 'Parasetamol',
        'description':
            'Parasetamol adalah obat yang digunakan untuk meredakan nyeri dan menurunkan demam.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Ibuprofen',
        'description':
            'Ibuprofen digunakan untuk meredakan nyeri dan inflamasi.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Amoxicillin',
        'description':
            'Amoxicillin adalah antibiotik untuk mengobati berbagai infeksi bakteri.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Parasetamol',
        'description':
            'Parasetamol adalah obat yang digunakan untuk meredakan nyeri dan menurunkan demam.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Ibuprofen',
        'description':
            'Ibuprofen digunakan untuk meredakan nyeri dan inflamasi.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Amoxicillin',
        'description':
            'Amoxicillin adalah antibiotik untuk mengobati berbagai infeksi bakteri.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Parasetamol',
        'description':
            'Parasetamol adalah obat yang digunakan untuk meredakan nyeri dan menurunkan demam.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Ibuprofen',
        'description':
            'Ibuprofen digunakan untuk meredakan nyeri dan inflamasi.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Amoxicillin',
        'description':
            'Amoxicillin adalah antibiotik untuk mengobati berbagai infeksi bakteri.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Parasetamol',
        'description':
            'Parasetamol adalah obat yang digunakan untuk meredakan nyeri dan menurunkan demam.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Ibuprofen',
        'description':
            'Ibuprofen digunakan untuk meredakan nyeri dan inflamasi.',
        'image': 'assets/images/parasetamol.jpg',
      },
      {
        'name': 'Amoxicillin',
        'description':
            'Amoxicillin adalah antibiotik untuk mengobati berbagai infeksi bakteri.',
        'image': 'assets/images/parasetamol.jpg',
      },
      // Tambahkan lebih banyak data sesuai kebutuhan
    ];

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
                        child: Text("Selamat Datang",
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
                    "Jenis-Jenis Obat ",
                    style: TextStyles.titleForm,
                  ),
                  SizedBox(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    child: const Divider(
                        thickness: 2, color: AppColors.hijauGelap),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = medicines[index];
                        final description = medicine['description']!;
                        final name = medicine['name']!;
                        return SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Card(
                            color: AppColors.hijauGelap,
                            child: ListTile(
                              title: Text(
                                name,
                                style: TextStyles.title
                                    .copyWith(color: AppColors.putihCerah),
                              ),
                              subtitle: description.length > 50
                                  ? Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailObat(
                                                  name: name,
                                                  description: description,
                                                  image: medicine['image']!,
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Baca Info',
                                            style: TextStyle(
                                              color: AppColors.darkBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                50), // Jarak antara teks "Baca Info" dengan deskripsi
                                        Expanded(
                                          child: Text(
                                            description,
                                            style: TextStyles.body.copyWith(
                                                color: AppColors.putihCerah),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      description,
                                      style: TextStyles.body.copyWith(
                                          color: AppColors.putihCerah),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              trailing: Image.asset(
                                medicine['image']!,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
                                if (description.length <= 100) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailObat(
                                        name: name,
                                        description: description,
                                        image: medicine['image']!,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      },
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
}
