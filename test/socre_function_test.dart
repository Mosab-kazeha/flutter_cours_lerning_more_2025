import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/helper/some_function.dart';

void main() {
  test('positive input (happy case)', () {
    num score = calculateScore(rightAnswer: 9, allQueCount: 10);
    expect(score, 90);
  });

  test('negative input (invalid case)', () {
    expect(
      () => calculateScore(rightAnswer: -9, allQueCount: 10),
      throwsException,
    );
  });

  test('Zero input (Edge case)', () {
    num score = calculateScore(rightAnswer: 0, allQueCount: 0);
    expect(score, 0);
  });

    test('positive input (Invalid case with Anser more that question)', () {
       expect(
      () => calculateScore(rightAnswer: 12, allQueCount: 10),
      throwsException,
    );
  });



   test('v2 positive input (happy case)', () {
    num score = calculateScore(rightAnswer: 9, allQueCount: 10,age: 10);
    expect(score, 100
    );
  });

  test('v2 negative input (invalid case)', () {
    expect(
      () => calculateScore(rightAnswer: -9, allQueCount: 10,age: 10),
      throwsException,
    );
  });

  test('v2 Zero input (Edge case)', () {
    num score = calculateScore(rightAnswer: 0, allQueCount: 0,age: 10);
    expect(score, 0);
  });

    test('v2 positive input (Invalid case with Anser more that question)', () {
       expect(
      () => calculateScore(rightAnswer: 12, allQueCount: 10,age: 10),
      throwsException,
    );
  });
}
