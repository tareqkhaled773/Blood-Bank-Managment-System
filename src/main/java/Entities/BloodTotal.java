package Entities;

import javax.persistence.*;

@Entity
@Table(name = "bloodTotal")
public class BloodTotal {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idbloodtotal")
    Integer idbloodtotal;

    @Column(name = "bloodgroup")
    String bloodgroup;

    @Column(name = "quantity")
    Integer quantity;

    @Column(name = "fklocation")
    Integer fklocation;

    public Integer getIdbloodtotal() {
        return idbloodtotal;
    }

    public void setIdbloodtotal(Integer idbloodtotal) {
        this.idbloodtotal = idbloodtotal;
    }

    public String getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(String bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getFklocation() {
        return fklocation;
    }

    public void setFklocation(Integer fklocation) {
        this.fklocation = fklocation;
    }
}
