class Character{
  int charId;
  String name;
  String nickname;
  String deadOrAlive;
  String image;
  String actorName;

  Character.fromJson(Map <String,dynamic> json){
    charId=json["char_id"];
    name=json["name"];
    nickname=json["nickname"];
    deadOrAlive=json["status"];
    image=json["img"];
    actorName=json["portrayed"];

  }
}