import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
// Needed for 'hello-world-api/api/default.service'...
import { HttpClientModule } from '@angular/common/http';
import { ApiModule, BASE_PATH } from 'hello-world-api';
import { environment } from '../environments/environment';

// https://github.com/swagger-api/swagger-codegen/blob/master/samples/client/petstore/typescript-angular-v5/npm/README.md#general-usage

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    ApiModule,
    HttpClientModule
  ],
  providers: [{ provide: BASE_PATH, useValue: environment.API_BASE_PATH }],
  bootstrap: [AppComponent]
})
export class AppModule { }
