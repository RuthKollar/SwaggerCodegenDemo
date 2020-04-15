/**
 * NOTE: This class is auto generated by the swagger code generator program (2.4.9).
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */
package com.kollar.service.api;

import com.kollar.service.model.ErrorResponse;
import com.kollar.service.model.HelloWorldResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2020-04-14T21:16:18.961-04:00")

@Api(value = "Default", description = "the Default API")
public interface DefaultApi {

    Logger log = LoggerFactory.getLogger(DefaultApi.class);

    default Optional<ObjectMapper> getObjectMapper() {
        return Optional.empty();
    }

    default Optional<HttpServletRequest> getRequest() {
        return Optional.empty();
    }

    default Optional<String> getAcceptHeader() {
        return getRequest().map(r -> r.getHeader("Accept"));
    }

    @ApiOperation(value = "", nickname = "helloOptions", notes = "", tags={  })
    @ApiResponses(value = {  })
    @RequestMapping(value = "/hello",
        produces = { "application/json" }, 
        consumes = { "application/json" },
        method = RequestMethod.OPTIONS)
    default ResponseEntity<Void> helloOptions() {
        if(getObjectMapper().isPresent() && getAcceptHeader().isPresent()) {
        } else {
            log.warn("ObjectMapper or HttpServletRequest not configured in default DefaultApi interface so no example is generated");
        }
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @ApiOperation(value = "Say Hello", nickname = "sayHello", notes = "", response = HelloWorldResponse.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Success", response = HelloWorldResponse.class),
        @ApiResponse(code = 200, message = "Error", response = ErrorResponse.class) })
    @RequestMapping(value = "/hello",
        produces = { "application/json" }, 
        //consumes = { "application/json" },
        method = RequestMethod.GET)
    default ResponseEntity<HelloWorldResponse> sayHello(@ApiParam(value = "The name of the person to whom to say hello") @Valid @RequestParam(value = "name", required = false) String name) {
        if(getObjectMapper().isPresent() && getAcceptHeader().isPresent()) {
            if (getAcceptHeader().get().contains("application/json")) {
                try {
                    return new ResponseEntity<>(getObjectMapper().get().readValue("{  \"message\" : \"message\"}", HelloWorldResponse.class), HttpStatus.NOT_IMPLEMENTED);
                } catch (IOException e) {
                    log.error("Couldn't serialize response for content type application/json", e);
                    return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }
        } else {
            log.warn("ObjectMapper or HttpServletRequest not configured in default DefaultApi interface so no example is generated");
        }
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);
    }

}