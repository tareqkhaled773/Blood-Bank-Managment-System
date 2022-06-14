package Entities;

import javax.persistence.*;

@Entity
@Table(name = "locations")
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idlocations")
    Integer idlocations;

    public Integer getIdlocations() {
        return idlocations;
    }

    public void setIdlocations(Integer idlocations) {
        this.idlocations = idlocations;
    }

    @Column(name = "city")
    String city;

    @Column(name = "street")
    String street;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }
}
