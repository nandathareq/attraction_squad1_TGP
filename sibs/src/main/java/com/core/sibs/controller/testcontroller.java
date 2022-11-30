package com.core.sibs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.core.sibs.entity.RekeningNasabah;
import com.core.sibs.service.ShowService;

import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequestMapping("/core_banking/details")
public class testcontroller {

    @Autowired
    ShowService showService;

    @GetMapping("/{id}")
    public List<RekeningNasabah> details(@PathVariable(required=true,name="id") Long id) {
        return showService.getRekening(id);
    }
    
}
