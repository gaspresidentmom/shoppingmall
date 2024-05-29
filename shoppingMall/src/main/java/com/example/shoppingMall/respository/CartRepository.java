package com.example.shoppingMall.respository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.shoppingMall.dto.CartDto;
import com.example.shoppingMall.entity.Cart;
import com.example.shoppingMall.entity.Product;

public interface CartRepository extends JpaRepository<Cart, Integer>{

	public Cart save(Product product);
	
	@Query(value = "SELECT p.pno, p.pname, p.filename, p.price, p.sale_state, c.quantity FROM product p join cart c ON p.pname = c.pname GROUP BY p.pname", nativeQuery = true)
    List<Object[]> findAllWithCartDtoAsArray();

    default List<CartDto> findAllWithCartDto() {
        List<Object[]> results = findAllWithCartDtoAsArray();
        List<CartDto> dtos = new ArrayList<>();
        for (Object[] result : results) {
        	CartDto dto = new CartDto();
        	dto.setPno((int) result[0]);
            dto.setPname((String) result[1]);
            dto.setFile((String) result[2]);
            dto.setPrice((int) result[3]);
            dto.setSaleState((String) result[4]);
            dto.setQuantity((int) result[5]);
            dtos.add(dto);
        }
        return dtos;
    }
	
}
