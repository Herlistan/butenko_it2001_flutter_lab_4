import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 890;
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          // ИЗОБРАЖЕНИЕ
          Image.asset(
            'images/18.png',
          ),
          ListTile(
            title: const Text('Общежитие №18'),
            subtitle: const Text('Краснодар ул. Калинина, 13'),
            dense: true,
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent, // <-- Button color
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                if (tab == 0) {
                  tab += 1;
                  _counter += 1;
                  setState(() {});
                } else {
                  tab = 0;
                  _counter -= 1;
                  setState(() {});
                }
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: Text('${_counter}'),
            ),
          ),
          Container(
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ТЕЛЕФОН
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        launch('tel:+79005553535');
                      },
                      child: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'ПОЗВОНИТЬ',
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                // МАРШРУТ
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        const url =
                            'https://www.google.com/maps/place/%D0%9A%D0%B0%D1%80%D0%BD%D0%B0%D0%B2%D0%B0%D0%BB/@45.0365839,38.955103,15.55z/data=!4m9!1m2!2m1!1z0LrQsNGA0YLRiw!3m5!1s0x40f04f0ae03da53d:0x3861754e4716807c!8m2!3d45.0376465!4d38.9536335!16s%2Fg%2F11bzrqbw1j';
                        final uri = Uri.parse(url);
                        launchUrl(uri);
                      },
                      child: Icon(
                        Icons.place,
                        color: Colors.green,
                      ),
                    ),
                    Text('МАРШРУТ', style: TextStyle(color: Colors.green))
                  ],
                ),
                // ПОДЕЛИТЬСЯ
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        Share.share('Поделиться ссылкой: ');
                      },
                      child: Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                    ),
                    Text('ПОДЕЛИТЬСЯ', style: TextStyle(color: Colors.green))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            padding: EdgeInsets.all(15.0),
            child: Text(
                '«Студенческий городок или так называемый кампус Кубанского ГАУ состоит'
                'из двадцати общежитий, в которых проживает более 8000 студентов,'
                ' что составляет 96% от всех нуждающихся. Студенты первого курса '
                'обеспечены местами в общежитии полностью. В соответствии с Положением '
                'о студенческих общежитиях университета, при поселении между '
                'администрацией и студентами заключается договор найма жилого помещения.'
                ' Воспитательная работа в общежитиях направлена на улучшение быта, '
                'соблюдение правил внутреннего распорядка, отсутствия асоциальных '
                'явлений в молодежной среде. Условия проживания в общежитиях'
                'университетского кампуса полностью отвечают санитарным нормам и требованиям: '
                'наличие оборудованных кухонь, душевых комнат, прачечных, читальных'
                ' залов, комнат самоподготовки, помещений для заседаний студенческих '
                'советов и наглядной агитации. С целью улучшения условий быта '
                'студентов активно работает система студенческого самоуправления'
                ' - студенческие советы организуют всю работу по самообслуживанию.'),
          ),

          // КАРТОЧКА ОБЩАГИ
        ],
      ),
    );
  }
}
