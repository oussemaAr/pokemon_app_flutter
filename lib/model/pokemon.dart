// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) => List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
    Pokemon({
        this.name,
        this.id,
        this.imageurl,
        this.xdescription,
        this.ydescription,
        this.height,
        this.category,
        this.weight,
        this.typeofpokemon,
        this.weaknesses,
        this.evolutions,
        this.abilities,
        this.hp,
        this.attack,
        this.defense,
        this.specialAttack,
        this.specialDefense,
        this.speed,
        this.total,
        this.malePercentage,
        this.femalePercentage,
        this.genderless,
        this.cycles,
        this.eggGroups,
        this.evolvedfrom,
        this.reason,
        this.baseExp,
    });

    String name;
    String id;
    String imageurl;
    String xdescription;
    String ydescription;
    String height;
    String category;
    String weight;
    List<Typeofpokemon> typeofpokemon;
    List<Typeofpokemon> weaknesses;
    List<String> evolutions;
    List<String> abilities;
    int hp;
    int attack;
    int defense;
    int specialAttack;
    int specialDefense;
    int speed;
    int total;
    MalePercentage malePercentage;
    MalePercentage femalePercentage;
    int genderless;
    Cycles cycles;
    String eggGroups;
    String evolvedfrom;
    String reason;
    String baseExp;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        id: json["id"],
        imageurl: json["imageurl"],
        xdescription: json["xdescription"],
        ydescription: json["ydescription"],
        height: json["height"],
        category: json["category"],
        weight: json["weight"],
        typeofpokemon: List<Typeofpokemon>.from(json["typeofpokemon"].map((x) => typeofpokemonValues.map[x])),
        weaknesses: List<Typeofpokemon>.from(json["weaknesses"].map((x) => typeofpokemonValues.map[x])),
        evolutions: List<String>.from(json["evolutions"].map((x) => x)),
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        hp: json["hp"],
        attack: json["attack"],
        defense: json["defense"],
        specialAttack: json["special_attack"],
        specialDefense: json["special_defense"],
        speed: json["speed"],
        total: json["total"],
        malePercentage: json["male_percentage"] == null ? null : malePercentageValues.map[json["male_percentage"]],
        femalePercentage: json["female_percentage"] == null ? null : malePercentageValues.map[json["female_percentage"]],
        genderless: json["genderless"],
        cycles: cyclesValues.map[json["cycles"]],
        eggGroups: json["egg_groups"],
        evolvedfrom: json["evolvedfrom"],
        reason: json["reason"],
        baseExp: json["base_exp"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "imageurl": imageurl,
        "xdescription": xdescription,
        "ydescription": ydescription,
        "height": height,
        "category": category,
        "weight": weight,
        "typeofpokemon": List<dynamic>.from(typeofpokemon.map((x) => typeofpokemonValues.reverse[x])),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => typeofpokemonValues.reverse[x])),
        "evolutions": List<dynamic>.from(evolutions.map((x) => x)),
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "special_attack": specialAttack,
        "special_defense": specialDefense,
        "speed": speed,
        "total": total,
        "male_percentage": malePercentage == null ? null : malePercentageValues.reverse[malePercentage],
        "female_percentage": femalePercentage == null ? null : malePercentageValues.reverse[femalePercentage],
        "genderless": genderless,
        "cycles": cyclesValues.reverse[cycles],
        "egg_groups": eggGroups,
        "evolvedfrom": evolvedfrom,
        "reason": reason,
        "base_exp": baseExp,
    };
}

enum Cycles { THE_20, THE_15, THE_10, THE_25, THE_40, THE_5, THE_35, THE_30, THE_80, THE_120, THE_19, EMPTY }

final cyclesValues = EnumValues({
    "-": Cycles.EMPTY,
    "10 ": Cycles.THE_10,
    "120 ": Cycles.THE_120,
    "15 ": Cycles.THE_15,
    "19 ": Cycles.THE_19,
    "20 ": Cycles.THE_20,
    "25 ": Cycles.THE_25,
    "30 ": Cycles.THE_30,
    "35 ": Cycles.THE_35,
    "40 ": Cycles.THE_40,
    "5 ": Cycles.THE_5,
    "80 ": Cycles.THE_80
});

enum MalePercentage { THE_875, THE_50, THE_0, THE_100, THE_25, THE_75, THE_125 }

final malePercentageValues = EnumValues({
    "0%": MalePercentage.THE_0,
    "100%": MalePercentage.THE_100,
    "12.5%": MalePercentage.THE_125,
    "25%": MalePercentage.THE_25,
    "50%": MalePercentage.THE_50,
    "75%": MalePercentage.THE_75,
    "87.5%": MalePercentage.THE_875
});

enum Typeofpokemon { GRASS, POISON, FIRE, FLYING, WATER, BUG, NORMAL, ELECTRIC, GROUND, FAIRY, FIGHTING, PSYCHIC, ROCK, STEEL, ICE, GHOST, DRAGON, DARK, NONE }

final typeofpokemonValues = EnumValues({
    "Bug": Typeofpokemon.BUG,
    "Dark": Typeofpokemon.DARK,
    "Dragon": Typeofpokemon.DRAGON,
    "Electric": Typeofpokemon.ELECTRIC,
    "Fairy": Typeofpokemon.FAIRY,
    "Fighting": Typeofpokemon.FIGHTING,
    "Fire": Typeofpokemon.FIRE,
    "Flying": Typeofpokemon.FLYING,
    "Ghost": Typeofpokemon.GHOST,
    "Grass": Typeofpokemon.GRASS,
    "Ground": Typeofpokemon.GROUND,
    "Ice": Typeofpokemon.ICE,
    "None": Typeofpokemon.NONE,
    "Normal": Typeofpokemon.NORMAL,
    "Poison": Typeofpokemon.POISON,
    "Psychic": Typeofpokemon.PSYCHIC,
    "Rock": Typeofpokemon.ROCK,
    "Steel": Typeofpokemon.STEEL,
    "Water": Typeofpokemon.WATER
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
