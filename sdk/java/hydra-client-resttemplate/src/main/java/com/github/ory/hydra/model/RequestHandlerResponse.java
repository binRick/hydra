/*
 * ORY Hydra
 * Welcome to the ORY Hydra HTTP API documentation. You will find documentation for all HTTP APIs here.
 *
 * OpenAPI spec version: latest
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package com.github.ory.hydra.model;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * RequestHandlerResponse
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2019-04-17T17:33:18.188+02:00")
public class RequestHandlerResponse {
  @JsonProperty("redirect_to")
  private String redirectTo = null;

  public RequestHandlerResponse redirectTo(String redirectTo) {
    this.redirectTo = redirectTo;
    return this;
  }

   /**
   * RedirectURL is the URL which you should redirect the user to once the authentication process is completed.
   * @return redirectTo
  **/
  @ApiModelProperty(value = "RedirectURL is the URL which you should redirect the user to once the authentication process is completed.")
  public String getRedirectTo() {
    return redirectTo;
  }

  public void setRedirectTo(String redirectTo) {
    this.redirectTo = redirectTo;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    RequestHandlerResponse requestHandlerResponse = (RequestHandlerResponse) o;
    return Objects.equals(this.redirectTo, requestHandlerResponse.redirectTo);
  }

  @Override
  public int hashCode() {
    return Objects.hash(redirectTo);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class RequestHandlerResponse {\n");
    
    sb.append("    redirectTo: ").append(toIndentedString(redirectTo)).append("\n");
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
