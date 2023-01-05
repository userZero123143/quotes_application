import 'package:flutter/material.dart';
import 'package:quotes_application/quote_page_one.dart';
import 'constants.dart';
import 'quote_page_two.dart';

class ShowQuotesByDay extends StatefulWidget {
  const ShowQuotesByDay({super.key});

  @override
  State<ShowQuotesByDay> createState() => _ShowQuotesByDayState();
}

class _ShowQuotesByDayState extends State<ShowQuotesByDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: const [
            // Expanded(child: QuotesPageOne()),
            Expanded(child: QuotesPageTwo()),
          ],
        ),
      ),
    );
  }
}
