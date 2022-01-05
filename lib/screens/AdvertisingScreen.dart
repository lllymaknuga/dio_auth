import 'package:flutter/material.dart';

class AdvertisingScreen extends StatefulWidget {
  AdvertisingScreen({Key? key}) : super(key: key);

  @override
  _AdvertisingScreenState createState() => _AdvertisingScreenState();
}

class _AdvertisingScreenState extends State<AdvertisingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Ваша реклама в нашем приложении',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Выделите ваш объект (шиномонтаж, \nмагазин запчастей) на карте',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              '500 ₽ / год',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 14, bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Image.asset(
                'assets/images/advertising_example.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Разместить объект на карте',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10, top: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Рекламный блок под картой',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              ' от 15 000 ₽ / год',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 14),
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Image.asset(
                'assets/images/advertising_banner.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Разместить рекламу',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
