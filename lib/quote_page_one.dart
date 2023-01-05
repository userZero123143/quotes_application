import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuotesPageOne extends StatefulWidget {
  const QuotesPageOne({Key? key}) : super(key: key);

  @override
  State<QuotesPageOne> createState() => _QuotesPageOneState();
}

class _QuotesPageOneState extends State<QuotesPageOne> {
  final random = Random();
  List quoteItems = [];
  Timer? timer;

  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('lib/assets/quotes.json');
      final data = jsonDecode(response);
      if (!mounted) return;
      quoteItems = data;
      quoteItems.shuffle();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  refreshQuotes() {
    readJson();
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      readJson();
    });
  }

  @override
  void initState() {
    super.initState();
    refreshQuotes();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // orientation = MediaQuery.of(context).orientation;
    // size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        quoteItems.isNotEmpty
            ? Expanded(
                child: Center(
                  child: quoteListView(),
                ),
              )
            : const Material(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }

  ListView quoteListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        // //extract list
        // List quoteList = quoteItems[index]['quotes'];

        // //create a list to keep track of whic quotes have been used
        // List doneQuotes = [];

        // while (doneQuotes.length < quoteList.length) {
        //   //choose a quote that hasn't been used yet
        //   String? quote;

        //   while (doneQuotes.contains(quote)) {
        //     int index = random.nextInt(quoteList.length);
        //     quote = quoteList[index];
        //   }

        return Card(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "${quoteItems[index]["author"]}",
                style: const TextStyle(
                  fontFamily: "cursive",
                  fontSize: 35,
                ),
              ),
              Text(
                "-${quoteItems[index]["authorInfo"]}",
                style: const TextStyle(
                  fontFamily: "Courier",
                  fontSize: 20,
                ),
              ),
              Text(
                "${quoteItems[index]['quotes'][random.nextInt(quoteItems[index]['quotes'].length)]}",
                // "$quote",
                style: const TextStyle(
                  fontFamily: "sans-serif",
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              // Text(
              //   DateTime.now().toString().split(' ')[0].replaceAll('-', '/'),
              //   style: const TextStyle(),
              // ),
              // Text(
              //   DateTime.now().toString(),
              // ),
            ],
          ),
        );
      },
    );
  }
}
