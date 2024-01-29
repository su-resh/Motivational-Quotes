// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

List<Quote> quoteFromJson(String str) => List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
    String text;
    String from;

    Quote({
        required this.text,
        required this.from,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        text: json["text"],
        from: json["from"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "from": from,
    };
}
