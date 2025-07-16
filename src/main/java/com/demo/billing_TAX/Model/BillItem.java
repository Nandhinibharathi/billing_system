package com.demo.billing_TAX.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "billing_db")
public class BillItem {
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  
  private String name;
  private double price;
  private int qty;

  @Column(name = "tax_rate", nullable = false, columnDefinition = "double default 0.05")
  private Double taxRate = 0.05;

  // ✅ Required no-argument constructor
  public BillItem() {
    this.taxRate = 0.05;
  }

  public BillItem(Integer id, String name, double price, int qty) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.qty = qty;
    this.taxRate = 0.05;
  }

  public BillItem(Integer id, String name, double price, int qty, Double taxRate) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.qty = qty;
    this.taxRate = taxRate;
  }

  // Getters ­– feel free to use Lombok if preferred
  public Integer getId() { return id; }
  public void setId(Integer id) { this.id = id; }

  public String getName() { return name; }
  public void setName(String name) { this.name = name; }

  public double getPrice() { return price; }
  public void setPrice(double price) { this.price = price; }

  public int getQty() { return qty; }
  public void setQty(int qty) { this.qty = qty; }

  public Double getTaxRate() { return taxRate; }
  public void setTaxRate(Double taxRate) { this.taxRate = taxRate; }

  public double getTotal() {
    return qty * price * (1 + taxRate);
  }
}
