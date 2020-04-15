package com.kollar.service.model;

import java.util.Objects;
import io.swagger.annotations.ApiModel;
import org.springframework.validation.annotation.Validated;
import javax.validation.Valid;
import javax.validation.constraints.*;

/**
 * The \&quot;OPTIONS\&quot; HTTP method is used for the CORS preflight request. Basically, the client browser is asking the server for permission to send the real HTTP request. 
 */
@ApiModel(description = "The \"OPTIONS\" HTTP method is used for the CORS preflight request. Basically, the client browser is asking the server for permission to send the real HTTP request. ")
@Validated
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2020-04-14T21:22:04.903-04:00")

public class DefaultCORSResponse   {

  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    return true;
  }

  @Override
  public int hashCode() {
    return Objects.hash();
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class DefaultCORSResponse {\n");
    
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }
}

