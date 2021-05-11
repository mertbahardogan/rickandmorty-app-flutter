// To parse this JSON data, do
//
//     final rickAndMorty = rickAndMortyFromJson(jsonString);

import 'dart:convert';

RickAndMorty rickAndMortyFromJson(String str) => RickAndMorty.fromJson(json.decode(str));

String rickAndMortyToJson(RickAndMorty data) => json.encode(data.toJson());

class RickAndMorty {
    RickAndMorty({
        this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created,
    });

    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    factory RickAndMorty.fromJson(Map<String, dynamic> json) => RickAndMorty(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        species: json["species"] == null ? null : json["species"],
        type: json["type"] == null ? null : json["type"],
        gender: json["gender"] == null ? null : json["gender"],
        origin: json["origin"] == null ? null : Location.fromJson(json["origin"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        image: json["image"] == null ? null : json["image"],
        episode: json["episode"] == null ? null : List<String>.from(json["episode"].map((x) => x)),
        url: json["url"] == null ? null : json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "species": species == null ? null : species,
        "type": type == null ? null : type,
        "gender": gender == null ? null : gender,
        "origin": origin == null ? null : origin.toJson(),
        "location": location == null ? null : location.toJson(),
        "image": image == null ? null : image,
        "episode": episode == null ? null : List<dynamic>.from(episode.map((x) => x)),
        "url": url == null ? null : url,
        "created": created == null ? null : created.toIso8601String(),
    };
}

class Location {
    Location({
        this.name,
        this.url,
    });

    String name;
    String url;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}
