import 'package:breaking_bad_by_bloc/views/allCharacters/cubit/cubit.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/models/character.dart';
import 'package:breaking_bad_by_bloc/views/allCharacters/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersList extends StatefulWidget {


  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
   List<Character> allCharacters;
   Widget showLoadingIndicator() {
     return Center(
       child: CircularProgressIndicator(
       ),
     );
   }

   Widget buildBlocWidget() {
     return BlocBuilder<CharactersCubit, CharactersState>(
       builder: (context, state) {
         if (state is CharactersLoaded) {
           allCharacters = (state).characters;
           return buildLoadedListWidgets();
         } else {
           return showLoadingIndicator();
         }
       },
     );
   }

   Widget buildLoadedListWidgets() {
     return SingleChildScrollView(
       child: Container(
         color: Colors.grey[800],
         child: Column(
           children: [
             buildCharactersList(),
           ],
         ),
       ),
     );
   }

   Widget buildCharactersList() {
     return GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           childAspectRatio: 2 / 3,
           crossAxisSpacing: 1,
           mainAxisSpacing: 1,
         ),
         shrinkWrap: true,
         physics: const ClampingScrollPhysics(),
         padding: EdgeInsets.zero,
         itemCount: allCharacters.length,
         itemBuilder: (ctx, index) {
       return CharacterItem(
           character: allCharacters[index]
       );
     },
     );
   }



   @override
   void initState() {
     super.initState();
     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent[100],
        title: Text("Characters",style: TextStyle(color: Colors.grey[800]),),
      ),
    );
  }
}
