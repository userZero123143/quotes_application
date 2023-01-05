import 'package:flutter/material.dart';
import 'package:quotes_application/page_routes.dart';
import 'package:quotes_application/quote_show.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Random Quotes"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              PageRoutes(
                widget: const ShowQuotesByDay(),
                text: "Enter",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
