package model;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private Date birthday;
    private String email;
    private String address;

    public User() {
    }

    public User(int id, String name, Date birthday, String email, String address) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.email = email;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
