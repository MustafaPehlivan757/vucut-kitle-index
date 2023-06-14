import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VKİ Hesaplayıcı',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: VKICalculator(),
    );
  }
}

class VKICalculator extends StatefulWidget {
  @override
  _VKICalculatorState createState() => _VKICalculatorState();
}

class _VKICalculatorState extends State<VKICalculator> {
  double _weight = 0;
  double _height = 0;
  double _vkiResult = 0;
  String _vkiCategory = '';

  void _calculateBMI() {
    if (_weight > 0 && _height > 0) {
      setState(() {
        _vkiResult = _weight / ((_height / 100) * (_height / 100));
        _vkiCategory = _getBMICategory(_vkiResult);
      });
    }
  }

  String _getBMICategory(double vki) {
    if (vki < 18.5) {
      return 'Zayıf';
    } else if (vki >= 18.5 && vki < 25) {
      return 'Normal Kilolu';
    } else if (vki >= 25 && vki < 30) {
      return 'Fazla Kilolu';
    } else {
      return '!!! Obez !!!';
    }
  }

  String _getBMICategoryAdvice(String category) {
    switch (category) {
      case 'Zayıf':
        return 'Sağlıklı kilo alımı için kalori alımını artırın, dengeli beslenin, yüksek protein tüketin, ara öğünler ekleyin, egzersiz yapın, sıvı alımına özen gösterin, stresi yönetin ve doktor/diyetisyen desteği alın.';
      case 'Normal Kilolu':
        return 'Sağlıklı yaşamınıza devam edin. Dengeli beslenme ve egzersiz yapmaya devam edin.';
      case 'Fazla Kilolu':
        return 'Sağlıklı kilo vermek için dengeli beslenin, düzenli egzersiz yapın, su tüketimine dikkat edin, işlenmiş gıdalardan kaçının, porsiyon kontrolü yapın ve uyku düzeninize özen gösterin.';
      case '!!! Obez !!!':
        return '!! Sağlıklı kilo vermek için sağlık profesyonelleriyle işbirliği yaparak özelleştirilmiş bir beslenme planı oluşturun, düzenli egzersiz yapın, porsiyon kontrolüne çok çok özen gösterin, sağlıklı bir yaşam tarzı benimseyin ve destek gruplarından destek alın.!! ';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vücut Kitle İndexi Hesaplayıcı'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _weight = double.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Kilonuzu girin (kg)',
                ),
              ),
              Container(
                height: 16.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _height = double.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Boyunuzu girin (cm)',
                ),
              ),
              Container(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: _calculateBMI,
                child: Text('Hesapla'),
              ),
              Container(
                height: 16.0,
              ),
              Text(
                'VKİ Sonucunuz: ${_vkiResult.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
              Container(
                height: 16.0,
              ),
              Text(
                'Durumunuz: $_vkiCategory',
                style: TextStyle(fontSize: 22),
              ),
              Container(
                height: 16.0,
              ),
              Text(
                'Tavsiyeler: ${_getBMICategoryAdvice(_vkiCategory)}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
