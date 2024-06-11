import 'package:flutter/material.dart';
import 'package:Pharalert/manual_input_form.dart';
import 'package:Pharalert/style.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map<String, dynamic>> _medicines = [
    {
      'name': 'Parasetamol 500mg',
      'dosage': '3x1 (1 kapsul)',
      'time': const TimeOfDay(hour: 10, minute: 30)
    },
  ];

  void _editMedicine(BuildContext context, int medicineIndex) {
    TextEditingController _nameController = TextEditingController(
      text: _medicines[medicineIndex]['name'],
    );
    TextEditingController _dosageController = TextEditingController(
      text: _medicines[medicineIndex]['dosage'],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Obat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: "Nama Obat"),
              ),
              TextField(
                controller: _dosageController,
                decoration: const InputDecoration(hintText: "Dosis"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Simpan'),
              onPressed: () {
                setState(() {
                  _medicines[medicineIndex]['name'] = _nameController.text;
                  _medicines[medicineIndex]['dosage'] = _dosageController.text;
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Hapus'),
              onPressed: () {
                setState(() {
                  _medicines.removeAt(medicineIndex);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectTime(BuildContext context, int medicineIndex) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _medicines[medicineIndex]['time'],
    );
    if (picked != null) {
      setState(() {
        _medicines[medicineIndex]['time'] = picked;
      });
    }
  }

  void _navigateToManualInputForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ManualInputForm(onAddMedicine: (newMedicine) {
          setState(() {
            _medicines.add(newMedicine);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    child: Text("Tambah pengingat",
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
                "Buat Pengingat",
                style: TextStyles.titleForm,
              ),
              SizedBox(
                height: 1,
                width: MediaQuery.of(context).size.width,
                child: const Divider(thickness: 2, color: AppColors.hijauGelap),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () => _navigateToManualInputForm(context),
                  child: const Text("Tambah Obat"),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(_medicines.length, (index) {
                  return SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Card(
                      color: AppColors.hijauGelap,
                      child: InkWell(
                        onTap: () => _editMedicine(context, index),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              trailing: InkWell(
                                onTap: () => _selectTime(context, index),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.alarm,
                                      color: AppColors.putihCerah,
                                    ),
                                    Text(
                                      _medicines[index]['time'].format(context),
                                      style: const TextStyle(
                                          color: AppColors.putihCerah),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                _medicines[index]['name'],
                                style: TextStyles.title
                                    .copyWith(color: AppColors.putihCerah),
                              ),
                              subtitle: Text(_medicines[index]['dosage'],
                                  style: TextStyles.body
                                      .copyWith(color: AppColors.putihCerah)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        )
      ],
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(88, 54),
      foregroundColor: Colors.white,
      backgroundColor: AppColors.hijauGelap,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(27)),
      ));
}
