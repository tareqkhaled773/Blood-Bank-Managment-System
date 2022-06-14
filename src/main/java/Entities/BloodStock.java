package Entities;

import javax.persistence.*;

@Entity
@Table(name = "bloodstock")
public class BloodStock {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "idbloodstock")
    Integer idbloodstock;

    @Column(name = "bloodgroup")
    String bloodgroup;

    @Column(name = "quantity")
    Integer quantity;

    @Column(name = "fkdonor")
    Integer fkdonor;

    @Column(name = "fklocation")
    Integer fklocation;

    @Column(name = "timestamp")
    String timestamp;

    public Integer getIdbloodstock() {
        return idbloodstock;
    }

    public void setIdbloodstock(Integer idbloodstock) {
        this.idbloodstock = idbloodstock;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodroup) {
        this.bloodgroup = bloodroup;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getFkdonor() {
        return fkdonor;
    }

    public void setFkdonor(Integer fkdonor) {
        this.fkdonor = fkdonor;
    }

    public Integer getFklocation() {
        return fklocation;
    }

    public void setFklocation(Integer fklocation) {
        this.fklocation = fklocation;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
