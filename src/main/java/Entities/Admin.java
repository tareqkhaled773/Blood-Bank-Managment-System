package Entities;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

    @Entity
    @Table( name = "admin")
    public class Admin implements Serializable {
        private static final long serialVersionUID = 1L;

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name = "idadmin")
        private int id;

        @Column(name = "Name")
        private String Name;

        @Column(name = "Username")
        private String Username;

        @Column(name = "Password")
        private String password;

        public String Name() {
            return Name;
        }
        public void setName(String Name) {
            this.Name = Name;
        }

        public String getUsername() {
            return Username;
        }

        public void setUsername(String username) {
            Username = username;
        }

        public String getPassword() {
            return password;
        }
        public void setPassword(String password) {
            this.password = password;
        }
    }


