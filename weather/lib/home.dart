import 'package:flutter/material.dart';
import 'package:weather/Karachimodel.dart';
import 'package:weather/services/state_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Weatherservices weatherServices = Weatherservices();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 151, 175, 241),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 151, 175, 241),
          elevation: 0,
          title: Text('Weather'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_accessibility_outlined))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: weatherServices.fetchRecords(),
                builder: (context, AsyncSnapshot<WWeather> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Hours ' + now.hour.toString()),
                        Text('minutes ' + now.minute.toString()),
                        Text('seconds ' + now.second.toString()),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 400,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/128/1146/1146869.png'),
                                    alignment: Alignment.topRight),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    //topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(50)),
                                color: Color.fromARGB(255, 169, 188, 240),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.name.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Country ' +
                                          snapshot.data!.sys!.country
                                              .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      snapshot.data!.main!.temp!.toString() +
                                          '\u2109',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 2,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Feels Like',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      snapshot.data!.main!.feelsLike
                                              .toString() +
                                          '\u2109',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 2,
                                          fontSize: 40),
                                    ),
                                    Text(
                                      'Date ' +
                                          now.day.toString() +
                                          '-' +
                                          now.month.toString() +
                                          '-' +
                                          now.year.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 2,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Reuseable(
                                  title: 'Wind',
                                  value: snapshot.data!.wind!.speed.toString() +
                                      '/h',
                                  img:
                                      'https://cdn-icons-png.flaticon.com/128/2011/2011448.png'),
                              Reuseable(
                                  title: 'Visibility',
                                  value: snapshot.data!.visibility.toString() +
                                      ' m',
                                  img:
                                      'https://cdn-icons-png.flaticon.com/128/1078/1078327.png'),
                              Reuseable(
                                  title: 'Humidity',
                                  value:
                                      snapshot.data!.main!.humidity.toString() +
                                          '%',
                                  img:
                                      'https://cdn-icons-png.flaticon.com/128/4064/4064415.png'),
                              Reuseable(
                                  title: 'SunRise',
                                  value: snapshot.data!.sys!.sunrise.toString(),
                                  img:
                                      'https://cdn-icons-png.flaticon.com/128/2584/2584049.png'),
                              Reuseable(
                                  title: 'SunSet',
                                  value: snapshot.data!.sys!.sunset.toString(),
                                  img:
                                      'https://cdn-icons-png.flaticon.com/128/4958/4958520.png'),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                        child: Text(
                      'Ass hole it has an error',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ));
                  }
                })));
  }
}

class Reuseable extends StatelessWidget {
  String title;
  String value;
  String img;
  Reuseable({
    super.key,
    required this.title,
    required this.value,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Colors.amber[100],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.only(right: 20),
        width: 80,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 169, 188, 240),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: Colors.blue.withOpacity(.3))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                      fontSize: 20),
                )),
            SizedBox(
              height: 15,
            ),
            Expanded(flex: 2, child: Image.network(img)),
            SizedBox(
              height: 15,
            ),
            Expanded(
                flex: 1,
                child: Text(value,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
