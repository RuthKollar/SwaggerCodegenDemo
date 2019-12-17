import { Component } from '@angular/core';
import { MyRandomNumberComponent } from './my.random.number.component';
import { DefaultService } from 'hello-world-api/api/default.service';
import { HelloWorldResponse } from 'hello-world-api/model/helloWorldResponse';
// HttpClient lives in a separate Angular module, so we'll need to import it in our main application module before we can use it.
import { Observable } from 'rxjs/Observable';
import {ErrorResponse} from 'hello-world-api/model/errorResponse';
import {HttpErrorResponse, HttpResponse} from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';

  value: string;
  helloWorldResponse: HelloWorldResponse;

  public myRandomNumberComponent: MyRandomNumberComponent;

  constructor(private defaultService: DefaultService) {
    this.myRandomNumberComponent = new MyRandomNumberComponent();
  }

  showMyRandomNumber() {
    return this.myRandomNumberComponent.doit();
  }

  // https://stackoverflow.com/questions/43055706/how-do-i-return-the-response-from-an-observable-http-async-call-in-angular
  // Observables are lazy so you have to subscribe to get the value.
  helloWorldGet() {
    let tmpName = null;
    if (this.value) {
      tmpName = this.value;
    }
    // https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
    // https://www.chromestatus.com/feature/5629709824032768
    this.defaultService
      .sayHello(tmpName, 'response', false)
      .subscribe(
        (helloWorldResponse: HttpResponse<HelloWorldResponse>) => {
          this.helloWorldResponse = helloWorldResponse.body;
          console.log(helloWorldResponse);
        },
        (httpErrorResponse: HttpErrorResponse) => {
          console.log(httpErrorResponse);
        },
        () => {
          console.log(this.defaultService);
        });
  }

  helloWorldGetMessage() {
    return this.helloWorldResponse && this.helloWorldResponse.message;
  }
}
