import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivational_app/quote_widget.dart';
import 'package:motivational_app/quotemodel.dart';
import 'package:motivational_app/service.dart';

void main() {
  runApp(MotivationalApp());
}

class MotivationalApp extends StatelessWidget {
  const MotivationalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
      home: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              DrawerHeader(
                child: Text(
                  'Motivational Quote',
                ),

              ),
              ListTile(title: Text("About"),
              leading: Icon(Icons.info),),
            ]),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(221, 224, 129, 1),
          shadowColor: Colors.amber,
          title: Text(
            "Motivational App",
            style: GoogleFonts.aBeeZee(),
          ),
        ),
        body: FutureBuilder<List<Quote>>(
          future: Service().getQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (snapshot.hasData) {
              final quotes = snapshot.data!;
              return ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  return QuoteWidget(quote: quotes[index]);
                },
              );
            }

            // Handle other cases if needed
            return const Center(child: Text("No data available."));
          },
        ),
      ),
    );
  }
}
