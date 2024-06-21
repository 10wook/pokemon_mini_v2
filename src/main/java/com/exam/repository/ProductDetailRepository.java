package com.exam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.exam.dto.ProductDetail;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
}
