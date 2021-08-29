
import 'package:breaking_bad_by_bloc/consts/strings.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/cubit/cubit.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../characters_details.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({ this.character}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, CharacterDetailsScreen , arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              color: Colors.grey[800],
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: character.image,
                fit: BoxFit.cover,
              )
                  : Image.asset('assets/images/no_internet.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
