import 'dart:convert';

Prediction predictionFromJson(String str) => Prediction.fromJson(json.decode(str));


class Prediction {
    String description;
    List<MatchedSubstring> matchedSubstrings;
    String placeId;
    String reference;
    StructuredFormatting structuredFormatting;
    List<Term> terms;
    List<String> types;

    Prediction({
        required this.description,
        required this.matchedSubstrings,
        required this.placeId,
        required this.reference,
        required this.structuredFormatting,
        required this.terms,
        required this.types,
    });

    factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        description: json["description"],
        matchedSubstrings: List<MatchedSubstring>.from(json["matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        structuredFormatting: StructuredFormatting.fromJson(json["structured_formatting"]),
        terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
        types: List<String>.from(json["types"].map((x) => x)),
    );

    
}

class MatchedSubstring {
    int length;
    int offset;

    MatchedSubstring({
        required this.length,
        required this.offset,
    });

    factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
        length: json["length"],
        offset: json["offset"],
    );

}

class StructuredFormatting {
    String mainText;
    List<MatchedSubstring> mainTextMatchedSubstrings;

    StructuredFormatting({
        required this.mainText,
        required this.mainTextMatchedSubstrings,
    });

    factory StructuredFormatting.fromJson(Map<String, dynamic> json) => StructuredFormatting(
        mainText: json["main_text"],
        mainTextMatchedSubstrings: List<MatchedSubstring>.from(json["main_text_matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    );

}

class Term {
    int offset;
    String value;

    Term({
        required this.offset,
        required this.value,
    });

    factory Term.fromJson(Map<String, dynamic> json) => Term(
        offset: json["offset"],
        value: json["value"],
    );

  
}