import 'package:breaking_bad_by_bloc/views/allCharacters/controller.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/cubit/cubit.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/models/character.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/repository.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/view/charachters_list.dart';
import 'package:breaking_bad_by_bloc/views/characters_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_by_bloc/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'consts/strings.dart';

class AppRouter{
   CharactersRepository charactersRepository;
   CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route generateRoute(RouteSettings settings){
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersList(),
          ),
        );

      // case CharacterDetails:
      //   final character = settings.arguments as Character;
      //
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) =>
      //           CharactersCubit(charactersRepository),
      //       child: CharacterDetails(
      //         character: character,
      //       ),
      //     ),
      //   );
    }
  }
}