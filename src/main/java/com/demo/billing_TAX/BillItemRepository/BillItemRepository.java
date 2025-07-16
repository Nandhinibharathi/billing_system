package com.demo.billing_TAX.BillItemRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.billing_TAX.Model.BillItem;

public interface BillItemRepository extends JpaRepository<BillItem, Integer> {}
