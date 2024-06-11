import 'package:flutter/material.dart';
import 'package:Pharalert/style.dart';

class ManualInputForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddMedicine;

  const ManualInputForm({Key? key, required this.onAddMedicine})
      : super(key: key);

  @override
  State<ManualInputForm> createState() => _ManualInputFormState();
}

class _ManualInputFormState extends State<ManualInputForm> {
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 10, minute: 30);

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitForm() {
    if (_nameController.text.isNotEmpty && _dosageController.text.isNotEmpty) {
      widget.onAddMedicine({
        'name': _nameController.text,
        'dosage': _dosageController.text,
        'time': _selectedTime
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Obat Baru"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama Obat"),
            ),
            TextField(
              controller: _dosageController,
              decoration: const InputDecoration(labelText: "Dosis"),
            ),
            Row(
              children: [
                Text("Waktu: ${_selectedTime.format(context)}"),
                TextButton(
                  onPressed: () => _selectTime(context),
                  child: const Text("Pilih Waktu"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: _submitForm,
              child: const Text("Simpan"),
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
      ));
}
