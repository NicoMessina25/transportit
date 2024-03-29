package com.funmesseg.transportit.api.park.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ParkDTO {
    
    private Long parkId;

    private Long cityid;

    private List<Long> trailersid;

}
