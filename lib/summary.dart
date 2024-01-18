import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary(this.data, {super.key});
  final List<Map<String, Object>> data;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: data.map((item) {
          bool cond = item['correctAns'] == item['selectedAns'];
          return Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cond
                      ? const Color.fromARGB(255, 145, 179, 206)
                      : const Color.fromARGB(255, 211, 162, 179),
                ),
                child: Text(
                  ((item['index'] as int) + 1).toString(),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      item['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      item['correctAns'] as String,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 205, 135, 214),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item['selectedAns'] as String,
                      style: TextStyle(
                          fontSize: 18,
                          color: cond
                              ? const Color.fromARGB(255, 158, 182, 201)
                              : const Color.fromARGB(255, 225, 173, 170)),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
