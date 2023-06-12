import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DayaPage extends StatefulWidget {
  const DayaPage({Key? key}) : super(key: key);

  @override
  _DayaPageState createState() => _DayaPageState();
}

class _DayaPageState extends State<DayaPage> {
  int watt = 0;
  int hours = 0;
  String selectedTarif = 'R-1/TR  Rp1352/kWh';
  int biayaPerHari = 0;
  int biayaPerBulan = 0;
  int biayaPerTahun = 0;

  final validator = FilteringTextInputFormatter.digitsOnly;
  final List<String> tarifList = [
    'R-1/TR  Rp1352/kWh',
    'R-2/TR  Rp1700/kWh',
    'R-3/TR  Rp1700/kWh',
    'Bisnis  Rp1445/kWh',
  ];

  void calculateBiaya() {
    setState(() {
      biayaPerHari =
          ((watt * hours) / 1000 * getTarifValue(selectedTarif)).toInt();
      biayaPerBulan = (biayaPerHari * 30);
      biayaPerTahun = (biayaPerBulan * 12);
    });
  }

  double getTarifValue(String tarif) {
    switch (tarif) {
      case 'R-1/TR  Rp1352/kWh':
        return 1352;
      case 'R-2/TR  Rp1700/kWh':
        return 1699;
      case 'R-3/TR  Rp1700/kWh':
        return 1700;
      case 'Bisnis  Rp1445/kWh':
        return 1445;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulasi Biaya Listrik'),
        backgroundColor: Colors.cyan,
        elevation: 10,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/logoEkolis.png',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            TextField(
              inputFormatters: [validator],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  watt = int.tryParse(value) ?? 0;
                });
                calculateBiaya();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.electric_bolt_rounded),
                labelText: 'Konsumsi Listrik - Watt',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              inputFormatters: [validator],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  hours = int.tryParse(value) ?? 0;
                });
                calculateBiaya();
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.timelapse_outlined),
                labelText: 'Lama Pemakaian - Jam per Hari',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedTarif,
              onChanged: (value) {
                setState(() {
                  selectedTarif = value ?? 'R-1/TR Rp1352/kWh';
                });
                calculateBiaya();
              },
              decoration: const InputDecoration(
                labelText: 'Tarif Listrik',
              ),
              items: tarifList.map((tarif) {
                return DropdownMenuItem<String>(
                  value: tarif,
                  child: Text(tarif),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Biaya Pemakaian Listrik Per Hari:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormatter.format(biayaPerHari),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Biaya Pemakaian Listrik Per Bulan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormatter.format(biayaPerBulan),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Biaya Pemakaian Listrik Per Tahun:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormatter.format(biayaPerTahun),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
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
