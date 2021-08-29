import 'package:breaking_bad_by_bloc/views/allCharacters/view/charachters_list.dart';
import 'package:breaking_bad_by_bloc/views/characters_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'consts/strings.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case allCharacters:
        return MaterialPageRoute(builder:(_)=>CharactersList());
      case characterDetails:
        return MaterialPageRoute(builder:(_)=>CharacterDetails());
    }
  }
}