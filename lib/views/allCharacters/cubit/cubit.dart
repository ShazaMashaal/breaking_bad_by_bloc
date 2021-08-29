import 'package:bloc/bloc.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/models/character.dart';
import 'package:flutter/material.dart';

import '../repository.dart';

part 'state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}