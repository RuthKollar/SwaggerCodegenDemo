import { MyRandomNumber } from './my.random.number';

export class MyRandomNumberComponent {
  public myRandomNumber: MyRandomNumber;

  constructor() {
    this.myRandomNumber = new MyRandomNumber();
  }
  doit() {
    return `And the number is ${this.myRandomNumber.getIt()}`;
  }
}
