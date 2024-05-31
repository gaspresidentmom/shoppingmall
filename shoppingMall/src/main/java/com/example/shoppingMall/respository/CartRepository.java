package com.example.shoppingMall.respository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.shoppingMall.dto.CartDto;
import com.example.shoppingMall.entity.Cart;
import com.example.shoppingMall.entity.Product;

public interface CartRepository extends JpaRepository<Cart, Integer>{

	
	@Query(value = "SELECT c.cno, p.pno, p.pname, c.username, p.filename, p.price, p.sale_state, c.quantity FROM product p join cart c ON p.pno = c.pno WHERE c.username = :username", nativeQuery = true)
    List<Object[]> findAllWithCartDtoAsArray(@Param("username") String username);

    default List<CartDto> findAllWithCartDto(String username) {
    	System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++");
        List<Object[]> results = findAllWithCartDtoAsArray(username);
        System.out.println("-------------------------------------------------");
        List<CartDto> dtos = new ArrayList<>();
        for (Object[] result : results) {
        	CartDto dto = new CartDto();
        	dto.setCno((int) result[0]);
        	dto.setPno((int) result[1]);
        	dto.setPname((String)result[2]);
            dto.setUsername((String) result[3]);
            dto.setFilename((String) result[4]);
            dto.setPrice((int) result[5]);
            dto.setSaleState((String) result[6]);
            dto.setQuantity((int) result[7]);
            System.out.println(dto);
            dtos.add(dto);
        }
        return dtos;
    }
	
}
