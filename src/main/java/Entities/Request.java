package Entities;


import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Requests")
public class Request {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idrequests")
    Integer ID;

    @Column(name = "firstname")
    private String First_Name;

    @Column(name = "lastname")
    private String Last_Name;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "bloodgroup")
    private String bloodgroup;

    @Column(name = "timestamp")
    private Date timestamp;

    @Column(name = "address")
    private String address;

    @Column(name = "quantity")
    private Integer Quantity;



    @Column(name = "locationfk")
    private Integer locationfk;

    public Integer getQuantity() {
        return Quantity;
    }

    public void setQuantity(Integer quantity) {
        Quantity = quantity;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getFirst_Name() {
        return First_Name;
    }

    public void setFirst_Name(String first_Name) {
        First_Name = first_Name;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String last_Name) {
        Last_Name = last_Name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getLocationfk() {
        return locationfk;
    }

    public void setLocationfk(Integer locationfk) {
        this.locationfk = locationfk;
    }
}
