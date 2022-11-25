package com.partnership.attraction.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.partnership.attraction.entity.AttractionPlace;
import com.partnership.attraction.service.DisplayDataService;

import io.micrometer.common.util.StringUtils;

@RestController
@RequestMapping("/partnership")
public class DisplayDataController {

    @Autowired
    DisplayDataService displayDataService;

    @GetMapping("/details")
    public List<AttractionPlace> details(@RequestParam(required = false) Map<String, String> params) {
        String city = params.get("city");
        String category = params.get("category");
        String sortBy = params.get("sortBy");
        String descending = params.get("descending");

        List<AttractionPlace> data = displayDataService.showAttraction(city, category);

        if (!StringUtils.isEmpty(sortBy)) {

            switch (sortBy) {
                case "price":
                    data.sort(Comparator.comparing(AttractionPlace::getPrice));
                    break;
                case "rating":
                    data.sort(Comparator.comparing(AttractionPlace::getPlaceRating));
                    break;
                default:
                    return null;
            }

            if (descending != null) {
                switch (descending) {
                    case "true":
                        Collections.reverse(data);
                        break;
                    case "false":
                        break;
                    default:
                        return null;
                }
            }

        }

        return data;
    }
}
