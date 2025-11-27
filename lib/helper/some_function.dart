num calculateScore({required int rightAnswer, required int allQueCount, int age=20}) {
  if (rightAnswer > allQueCount) {
    throw Exception('There is an Answers more that Question (Invalid Input)');
  }
  if (allQueCount == 0) {
    return 0;
  }
  if (rightAnswer < 0 || allQueCount < 0) {
    throw Exception('There is a Negtive count or The Question COunt is Zero');
  } else {
    if (age>=20) {
      
    return (rightAnswer / allQueCount) * 100;
    } else {
      return ((rightAnswer / allQueCount) * 100 )+10;
    }
  }
}
// ? TDD : Test driven Develoment
// ! input / output -> excpect that this input will cause that ourput /
// ! the input has many cases (happy cases , invalid cases , edge cases)
// ? Unit Test 