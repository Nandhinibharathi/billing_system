
package com.demo.billing_TAX.Model;

public class Customer {
    private String name;
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	private String phone;
    private String place;

    public Customer() { } // This default constructor is essential!

    // Getters and setters...
}
