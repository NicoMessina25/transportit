package com.funmesseg.transportit.api._package.dto;

import java.util.Date;

import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.enums.EShippingState;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PackageDTO {

    private Long packageID; 
    private float weight;
    private float size;
    private float price; 
    private EShippingState state;
    private ShippingRequest shippingRequest;
    private int cityTo;
    private int shippingRequestID;
    private int routeMapID;
    private String recipientDocument;
    private String recipientFirstName;
    private float feeCoefficient; 
 
}
