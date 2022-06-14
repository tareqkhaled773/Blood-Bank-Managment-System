package Beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


public class BloodQuantity {
    String bType;
    Long quantity;
    private String id;

    public String getbType() {
        return bType;
    }

    public void setbType(String bType) {
        this.bType = bType;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Id
    public String getId() {
        return id;
    }
}
