// To parse this JSON data, do
//
//     final passengerModel = passengerModelFromJson(jsonString);

import 'dart:convert';

class PassengerModel {
    PassengerModel({
        this.totalPassengers,
        this.totalPages,
        this.data,
    });

    final int? totalPassengers;
    final int? totalPages;
    final List<Passenger>? data;

    factory PassengerModel.fromRawJson(String str) => PassengerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        totalPassengers: json["totalPassengers"] == null ? null : json["totalPassengers"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        data: json["data"] == null ? null : List<Passenger>.from(json["data"].map((x) => Passenger.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers == null ? null : totalPassengers,
        "totalPages": totalPages == null ? null : totalPages,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Passenger {
    Passenger({
        this.id,
        this.name,
        this.trips,
        this.airline,
        this.v,
    });

    final String? id;
    final String? name;
    final int? trips;
    final dynamic airline;
    final int ?v;

    factory Passenger.fromRawJson(String str) => Passenger.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        trips: json["trips"] == null ? null : json["trips"],
        airline: json["airline"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "trips": trips == null ? null : trips,
        "airline": airline,
        "__v": v == null ? null : v,
    };
}

class AirlineElement {
    AirlineElement({
        this.id,
        this.airlineId,
        this.name,
        this.country,
        this.logo,
        this.slogan,
        this.headQuaters,
        this.website,
        this.established,
        this.v,
    });

    final String? id;
    final int? airlineId;
    final String?name;
    final String?country;
    final String?logo;
    final Slogan?slogan;
    final String?headQuaters;
    final Website? website;
    final String? established;
    final int? v;

    factory AirlineElement.fromRawJson(String str) => AirlineElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AirlineElement.fromJson(Map<String, dynamic> json) => AirlineElement(
        id: json["_id"] == null ? null : json["_id"],
        airlineId: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        country: json["country"] == null ? null : json["country"],
        logo: json["logo"] == null ? null : json["logo"],
        slogan: json["slogan"] == null ? null : sloganValues.map[json["slogan"]],
        headQuaters: json["head_quaters"] == null ? null : json["head_quaters"],
        website: json["website"] == null ? null : websiteValues.map[json["website"]],
        established: json["established"] == null ? null : json["established"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "id": airlineId == null ? null : airlineId,
        "name": name == null ? null : name,
        "country": country == null ? null : country,
        "logo": logo == null ? null : logo,
        "slogan": slogan == null ? null : sloganValues.reverse[slogan],
        "head_quaters": headQuaters == null ? null : headQuaters,
        "website": website == null ? null : websiteValues.reverse[website],
        "established": established == null ? null : established,
        "__v": v == null ? null : v,
    };
}

enum Slogan { SMOOTH_AS_SILK_I_FLY_THAI, SHARING_THE_WORLD_FLYING_TOGETHER, MOVE_BEYOND }

final sloganValues = EnumValues({
    "Move Beyond": Slogan.MOVE_BEYOND,
    "Sharing the World, Flying Together": Slogan.SHARING_THE_WORLD_FLYING_TOGETHER,
    "Smooth as Silk / I Fly THAI": Slogan.SMOOTH_AS_SILK_I_FLY_THAI
});

enum Website { WWW_YOAIRWAYS_COM, WWW_EVAAIR_COM, WWW_CATHAYPACIFIC_COM }

final websiteValues = EnumValues({
    "www.cathaypacific.com": Website.WWW_CATHAYPACIFIC_COM,
    "www.evaair.com": Website.WWW_EVAAIR_COM,
    "www.yoairways.com": Website.WWW_YOAIRWAYS_COM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
