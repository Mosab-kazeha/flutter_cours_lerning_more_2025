void main() {
  dynamic anyThing = "20";

  print(anyThing);
  print(anyThing.runtimeType);

  anyThing = 50;

  print(anyThing);
  print(anyThing.runtimeType);

  int index = 20;

  index = 30;

  print(index);
  print(index.runtimeType);

  double sales = 0.5;

  print(sales);
  print(sales.runtimeType);

  // sales = number;
  index = sales.toInt();

  num? number = 5;

  print(number / 0);

  print("the number $number is int");
  print(number.runtimeType);

  number = 0.2;

  print("what is the number dataType $number");
  print("${number.runtimeType}");

  String? name;

  name = '';

  print(name!.length);
  print(name.runtimeType);

  //! if we don't give the var value it take dynamic
  var temp;
  temp = 'temp data';
  //? String temp = "temp data";

  temp = 20;

  print(temp);
  print(temp.runtimeType);

  const int phoneNumber = 099999999;

  // phoneNumber = 10;

  print(phoneNumber);
  print(phoneNumber.runtimeType);

  final String lastName;

  //! final is like the const antil give it a value
  lastName = "kazeha";
  // lastName = "orfaly";

  print(lastName);
  print(lastName.runtimeType);

  final birthDate;

  birthDate = "2004-01-30";

  print(birthDate);

  int priceIPhone = 3000;
  int priceSamsung = 2700;
  int priceXiaomi = 2000;
  int myMaony = 2700;

  //* < > <= >= == !=
  //* && || ??
  if (myMaony >= priceXiaomi) {
    print("you can pay priceXiaomi");
  }
  if (myMaony >= priceSamsung) {
    print("you can pay priceSamsung");
  }
  if (myMaony >= priceIPhone) {
    print("you can pay Iphone");
  }

  bool? isFav;

  //! isFav ?? true
  //* how it work
  //! if (isFav is Null) {
  //!   isFav = true;
  //!  }

  print(isFav ?? true);

  wichPhoneCanIHave(5000, 'Iphone', "samsung", 8000, 5000);
  wichPhoneCanIHave(10000, '17 pro', "S 26 ", 14000, 19999);
  wichCarCanIHave(
    myMany: 10000,
    firstCarName: "kia",
    secondCarName: "tesal",
    firstCar: 5000,
    secondCar: 100000,
  );
}

void wichPhoneCanIHave(
  int myMany,
  String firstPhoneName,
  String secondPhoneName,
  int firstPhone,
  int secondPhone,
) {
  if (myMany >= firstPhone) {
    print("you can pay $firstPhoneName");
  }
  if (myMany >= secondPhone) {
    print("you can pay $secondPhoneName");
  }
}

void wichCarCanIHave({
  required int myMany,
  required String firstCarName,
  required String secondCarName,
  required int firstCar,
  int? secondCar,
}) {
  if (myMany >= firstCar) {
    print("you can pay $firstCarName");
  }
  if (myMany >= secondCar!) {
    print("you can pay $secondCarName");
  }
}
