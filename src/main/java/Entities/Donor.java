package Entities;

import javax.persistence.*;
import javax.servlet.http.Part;
import java.io.InputStream;
import java.sql.Blob;

@Entity
@Table(name = "donor")
public class Donor {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "iddonor")
    Integer iddonor;

    @Column(name = "firstname")
    String firstname;

    @Column(name = "lastname")
    String lastname;

    @Column(name = "email")
    String email;

    @Column(name = "phone")
    String phone;

    @Column(name = "bloodtype")
    String bloodtype;

    @Lob
    @Column(name = "picture",columnDefinition = "blob")
    byte[] picture;

    @Transient
    String base64;


    public Integer getIddonor() {
        return iddonor;
    }

    public void setIddonor(Integer iddonor) {
        this.iddonor = iddonor;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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

    public String getBloodtype() {
        return bloodtype;
    }

    public void setBloodtype(String bloodtype) {
        this.bloodtype = bloodtype;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }
}
