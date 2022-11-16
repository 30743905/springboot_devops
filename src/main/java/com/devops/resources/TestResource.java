package com.devops.resources;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/test")
public class TestResource {

    @GetMapping("/time")
    public String time(){
        return "time:"+new Date();
    }

}
