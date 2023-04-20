import 'package:flutter/material.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      // body: TextFormField(
      //   controller: _cityTextController,
      //   onChanged: (value) {
      //     city1 = value;
      //     setState(() {
      //       // checkweather(
      //       //     "${snapshot.data[0].weather}", context);
      //     });
      //   },
      //   style: TextStyle(color: Colors.white),
      //   decoration: InputDecoration(
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(15),
      //       borderSide: BorderSide(width: 1, color: Color(0xffE6E8EB)),
      //     ),
      //     hintText: 'Search Country',
      //     hintStyle: TextStyle(color: Colors.white),
      //     suffixIcon: GestureDetector(
      //       onTap: () async {
      //         final response =
      //             await _dataservices.getweather(_cityTextController.text);
      //         setState(() {
      //           _response = response;
      //         });

      //         _cityTextController.clear();
      //       },
      //       child: Icon(
      //         Icons.search,
      //         color: Colors.white,
      //         size: 35,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class Cities extends StatelessWidget {
  const Cities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
