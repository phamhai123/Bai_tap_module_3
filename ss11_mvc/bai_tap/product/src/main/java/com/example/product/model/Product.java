package com.example.product.model;

public class Product {
    private int id;
    private String name;
    private String core;
    private String description;
    private String producer;

    public Product() {
    }

    public Product(int id, String name, String core, String description, String producer) {
        this.id = id;
        this.name = name;
        this.core = core;
        this.description = description;
        this.producer = producer;
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

    public String getCore() {
        return core;
    }

    public void setCore(String core) {
        this.core = core;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

}
