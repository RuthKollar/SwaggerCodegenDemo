// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random

export class MyRandomNumber {
  getIt() {
    return Math.floor(Math.random() * Math.floor(10)) + 1;
  }
}
