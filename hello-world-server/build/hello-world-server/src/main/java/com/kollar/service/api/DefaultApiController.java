package com.kollar.service.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kollar.service.model.HelloWorldResponse;
import io.swagger.annotations.ApiParam;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Optional;
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2020-04-15T01:22:38.109-04:00")

@Controller
public class DefaultApiController implements DefaultApi {

    private final ObjectMapper objectMapper;

    private final HttpServletRequest request;

    @org.springframework.beans.factory.annotation.Autowired
    public DefaultApiController(ObjectMapper objectMapper, HttpServletRequest request) {
        this.objectMapper = objectMapper;
        this.request = request;
    }

    @Override
    public Optional<ObjectMapper> getObjectMapper() {
        return Optional.ofNullable(objectMapper);
    }

    @Override
    public Optional<HttpServletRequest> getRequest() {
        return Optional.ofNullable(request);
    }

    //TODO: You need to implement the interface!
    public ResponseEntity<HelloWorldResponse> sayHello(@ApiParam(value = "The name of the person to whom to say hello") @Valid @RequestParam(value = "name", required = false) String name) {
        final HelloWorldResponse response = new HelloWorldResponse();
        if (StringUtils.isEmpty(name)) {
            response.setMessage("Hello!");
        } else {
            response.setMessage("Hello " + name + "!");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
