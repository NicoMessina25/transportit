package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "driver")
@Getter
@Setter
@NoArgsConstructor
public class Driver {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long driver;

    @Column
    private String firstname;

    @Column
    private String lastname;

    @Column
    private Long dni;
    
    @Column
    private String address;

    @Column
    private String province;

    @Column
    private String city;

    @Column
    private Long phone;

    @Column(columnDefinition = "bit")
    private boolean particular;

    @Column(columnDefinition = "bit")
    private boolean available;

    @JoinColumn(name = "fee")
    @ManyToOne
    private FeePayment feepayment;

    @JoinColumn(name = "truck")
    @ManyToOne
    private Truck truck;

    @JoinColumn(name = "currentcity")
    @ManyToOne
    private City currentcity;

    @Override
    public String toString(){
        return "Driver: Id:" + driver + ", name: " + firstname + ", lastname: " + lastname;
    }

}


