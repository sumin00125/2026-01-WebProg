package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductService {
    private HashMap<String, Product> products;
    private int nextId = 6;

    public ProductService() {
        products = new HashMap<>();

        products.put("p1", new Product("p1", "Galaxy S24", "Samsung", 1350000, "2026-01-10"));
        products.put("p2", new Product("p2", "iPhone 16", "Apple", 1500000, "2026-01-12"));
        products.put("p3", new Product("p3", "Pixel 9", "Google", 1190000, "2026-01-15"));
        products.put("p4", new Product("p4", "Xiaomi 15", "Xiaomi", 980000, "2026-01-18"));
        products.put("p5", new Product("p5", "Xperia 1 VI", "Sony", 1290000, "2026-01-20"));
    }

    // 전체 조회
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    // 단건 조회
    public Product find(String id) {
        return products.get(id);
    }

    // 등록
    public String add(Product product) {
        String id = "p" + nextId;
        product.setId(id);
        products.put(id, product);
        nextId++;
        return id;
    }

    // 수정
    public boolean update(Product product) {
        if (products.containsKey(product.getId())) {
            products.put(product.getId(), product);
            return true;
        }
        return false;
    }

    // 삭제
    public boolean delete(String id) {
        if (products.containsKey(id)) {
            products.remove(id);
            return true;
        }
        return false;
    }
}
