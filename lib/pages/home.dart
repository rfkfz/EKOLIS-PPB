import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AwalPage extends StatelessWidget {
  final List<Map<String, dynamic>> newsList = [
    {
      'title': 'April - Juni 2023',
      'url':
          'https://web.pln.co.id/statics/uploads/2023/04/Surat-ke-Unit-Penetapan-TA-Bln-April-Juni-2023.jpg',
    },
    {
      'title': 'Januari - Maret 2023',
      'url':
          'https://web.pln.co.id/statics/uploads/2022/12/ttl-jan-mar-2023.jpg',
    },
    {
      'title': 'Oktober - Desember 2022',
      'url': 'https://web.pln.co.id/statics/uploads/2022/09/TTL-OKT-DES.jpg',
    },
    {
      'title': 'Juli - September 2022',
      'url':
          'https://web.pln.co.id/statics/uploads/2022/06/TA-Juli-s.d-Sept-2022-3.jpg',
    },
    {
      'title': 'April - Juni 2022',
      'url': 'https://web.pln.co.id/statics/uploads/2022/03/ttl-april-juni.jpg',
    },
    {
      'title': 'Januari - Maret 2022',
      'url': 'https://web.pln.co.id/statics/uploads/2022/01/ttl.jpg',
    },
    {
      'title': 'Oktober - Desember 2021',
      'url': 'https://web.pln.co.id/statics/uploads/2022/09/TTL-OKT-DES.jpg',
    },
    {
      'title': 'Juli - September 2021',
      'url':
          'https://web.pln.co.id/statics/uploads/2021/06/tf_juli_sep_2021.pdf',
    },
    {
      'title': 'April - Juni 2021',
      'url':
          'https://web.pln.co.id/statics/uploads/2021/06/tf_april_juni_2021.pdf',
    },
    {
      'title': 'Januari - Maret 2021',
      'url':
          'https://web.pln.co.id/statics/uploads/2021/06/tf_jan_maret_2021.pdf',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dokumentasi Tarif Listrik'),
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
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> news = newsList[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => _launchURL(news['url']),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.link_rounded),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        news['title'],
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
