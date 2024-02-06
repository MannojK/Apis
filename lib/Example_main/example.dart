void main() {
  List<int> numbers = [
    4,
    435,
    345,
    3456,
  ];
  var powNumbers = numbers.map((num) => num * 2);
  print(powNumbers);

  List<String> names = ['Max', 'Ed', 'ddj', 'djg'];
  var lengthNames = names.map((name) => name.length);
  print(lengthNames);

  List<Friend> myFriends = [
    Friend(name: 'Daniel', age: 18),
    Friend(name: 'Jessi', age: 43),
    Friend(name: 'daic', age: 42),
    Friend(name: 'Bro', age: 58),
    Friend(name: 'King', age: 48),
  ];
 myFriends.map((friend) => BestFriend(namee:friend.name), ).
forEach((BestFriend)=> print(BestFriend.say()) );
}

class BestFriend {
  String namee;
  BestFriend({required this.namee});
  String say(){
    return 'One of my best friend as $namee';
  }
}

class Friend {
  String name;
  int age;
  Friend({
     required this.name,
    required this.age,
  });
}
