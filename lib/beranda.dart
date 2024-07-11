import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';
import 'package:Pharalert/detail_obat.dart';

class Medicine {
  final String name;
  final String description;
  final String image;

  Medicine({
    required this.name,
    required this.description,
    required this.image,
  });
}

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Medicine>> categorizedMedicines = {
      'Obat Pereda Nyeri': [
        Medicine(
          name: 'Parasetamol',
          description:
              'Parasetamol adalah obat yang digunakan untuk meredakan nyeri dan menurunkan demam.',
          image: 'assets/images/parasetamol.jpg',
        ),
        Medicine(
          name: 'Ibuprofen',
          description:
              'Ibuprofen digunakan untuk meredakan nyeri dan inflamasi.',
          image: 'assets/images/ibuprofen.jpg',
        ),
      ],
      'Obat Batuk & pilek': [
        Medicine(
          name: 'Rhinos SR ',
          description:
              'Rhinos SR meredakan gejala rhinitis alergi dan pilek (common cold), seperti bersin, gatal di hidung, hidung meler maupun tersumbat, dan mata berair.',
          image: 'assets/images/rhinos.jpg',
        ),
        Medicine(
          name: 'Telfast Plus ',
          description:
              'Telfast Plus merupakan obat dengan kandungan Fexofenadine dan Pseudoephedrine. Obat ini digunakan untuk meredakan gejala rhinitis alergi. Fexofenadine merupakan metabolite dari terfenadine yang memiliki efek antihistamin (anti radang). Pseudoephedrine merupakan dekongestan dengan efek vasokonstriksi yang membantu meredakan hidung tersumbat akibat rhinitis alergi. Dalam penggunaan obat ini harus SESUAI DENGAN PETUNJUK DOKTER.',
          image: 'assets/images/tel.jpg',
        ),
      ],
      'Obat Alergi': [
        Medicine(
          name: 'Cetirgi  ',
          description:
              'Cetirizine merupakan obat untuk meredakan gejala akibat reaksi alergi, seperti mata berair, bersin-bersin, hidung meler, atau gatal di kulit, tenggorokan, maupun hidung. Obat ini tersedia dalam bentuk tablet, kaplet, kapsul, sirop, atau obat tetes oral (drops). Cetirizine merupakan obat antihistamin.',
          image: 'assets/images/cen.jpeg',
        ),
        Medicine(
          name: 'Dextamine ',
          description:
              'Obat ini dapat digunakan untuk meredakan  urtikaria, rhinitis alergi, pilek,dermatitis, atau konjungtivitis akibat alergi. Dextamine mengandung dexamethasone yang dapat meredakan peradangan, dan dexchlorpheniramine yang dapat meredakan gejala alergi.',
          image: 'assets/images/dex.jpg',
        ),
      ],
      'Obat Demam': [
        Medicine(
          name: 'Sanmol Forte',
          description:
              'Sanmol Forte bekerja pada pusat pengatur suhu di hipotalamus untuk menurunkan suhu tubuh (antipiretik) serta menghambat sintesis prostaglandin sehingga dapat mengurangi nyeri ringan sampai sedang (analgetik). Obat ini digunakan untuk meringankan rasa sakit pada keadaan sakit kepala, sakit gigi dan menurunkan demam.',
          image: 'assets/images/san.jpeg',
        ),
        Medicine(
          name: 'Fasidol Forte',
          description:
              'ASIDOL FORTE merupakan obat yang mengandung zat aktif Paracetamol. Obat ini digunakan untuk mengatasi demam dan sebagai perda nyeri seperti sakit kepala, sakit gigi dan nyeri ringan lainnya. Dewasa: 1-2 kaplet, 3-4 kali per hari. Penggunaan maximum 8 kaplet per hari.',
          image: 'assets/images/fa.jpg',
        ),
      ],
      'Obat Tulang & Sendi': [
        Medicine(
          name: 'Zheng Gu Shui',
          description:
              'ZHENG GU SHUI merupakan minyak gosok maupun minyak urut yang berkhasiat membantu penyembuhan retak tulang dan keseleo, meringankan rasa sakit reumatik, meredakan bengkak, melancarkan sirkulasi darah, dan meredakkan kelelahan sebelum dan setelah berolahraga serta aktivitas fisik.',
          image: 'assets/images/zh.webp',
        ),
        Medicine(
          name: 'Voltaren Emulgel ',
          description:
              'Voltaren Emulgel mengandung bahan aktif diklofenak, obat NSAID (Non-Steroidal Anti-Inflammatory/Non-Steroid Anti-Inflamasi). Gel ini dioleskan perlahan pada bagian yang terdampak, yang dengan cepat diserap ke dalam kulit untuk menghilangkan nyeri, mengurangi peradangan, dan mempercepat pemulihan.',
          image: 'assets/images/voll.jpg',
        ),
      ],
      'Obat Lambung': [
        Medicine(
          name: 'Strocain P ',
          description:
              'STROCAIN P merupakan obat denagn kandungan Polymigel yang digunakan untuk mengatasi kelebihan asam lambung, ulkus lambung, usus 12 jari dengan gejala seperti mual, heartburn, dan kembung. Obat ini tidak boleh digunakan secara terus menerus selama 2 minggu kecuali atas perintah dokter..',
          image: 'assets/images/st.png',
        ),
        Medicine(
          name: 'Polycrol Forte  ',
          description:
              'Polycrol Forte merupakan obat yang mengandung Aluminium hidroksida, magnesium hidroksida dan methylpolysiloxane. Obat ini digunakan untuk mengobati gangguan pada saluran pencernaan seperti gastritis, perut kembung, maag, dispepsia, hiatus hernia, tukak lambung dan usus duabelas jari.',
          image: 'assets/images/pol.webp',
        ),
      ],
    };

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
                        child: Text("Jenis-Jenis Obat",
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: categorizedMedicines.keys.length,
                      itemBuilder: (context, index) {
                        String category =
                            categorizedMedicines.keys.elementAt(index);
                        List<Medicine> medicines =
                            categorizedMedicines[category]!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: TextStyles.titleForm,
                            ),
                            const Divider(
                                thickness: 2, color: AppColors.hijauGelap),
                            ...medicines.map((medicine) {
                              return SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Card(
                                  color: AppColors.hijauGelap,
                                  child: ListTile(
                                    title: Text(
                                      medicine.name,
                                      style: TextStyles.title.copyWith(
                                          color: AppColors.putihCerah),
                                    ),
                                    subtitle: Text(
                                      medicine.description,
                                      style: TextStyles.body.copyWith(
                                          color: AppColors.putihCerah),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        medicine.image,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailObat(
                                            name: medicine.name,
                                            description: medicine.description,
                                            image: medicine.image,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                            const SizedBox(height: 20),
                          ],
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
