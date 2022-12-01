package com.partnership.attraction.controller;

import java.text.ParseException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.partnership.attraction.controller.dto.TicketDto;
import com.partnership.attraction.entity.AttractionPlace;
import com.partnership.attraction.service.DisplayDataService;

import io.micrometer.common.util.StringUtils;

@RestController
@RequestMapping("/partnership")
public class DisplayDataController {

    @Autowired
    DisplayDataService displayDataService;

    @GetMapping("/details")
    public List<AttractionPlace> allDetails(@RequestParam(required = false) Map<String, String> params) {
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

    @GetMapping("/details/{id}")
    public AttractionPlace details(@PathVariable(required = true, name = "id") Integer id) {
        return displayDataService.showDetails(id);
    }

    @GetMapping("/available")
    public String availableDetails(@RequestParam(required = false) Map<String, String> params) throws ParseException {
        int id = Integer.parseInt(params.get("attractionId"));
        String date = params.get("date");
        int quantity = Integer.parseInt(params.get("quantity"));
        return displayDataService.isAvailable(id, date, quantity);
    }

    @GetMapping("/ticket/{bookingcode}")
    public List<TicketDto> getTickets(@PathVariable(required = true, name = "bookingcode") String bookingCode) {
        return displayDataService.getTickets(bookingCode);
    }
}
