package product.repository;

import product.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ISProductRepositoryImpl implements ISProductRepository{
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Iphone", 2000, "new Iphone Xx", "Iphone"));
        products.put(2, new Product(2, "Sam Sung", 30000, "Sam sung ", "Sam Sung"));
        products.put(3, new Product(3, "Doche", 20000, "new Iphone Xx", "Iphone"));
        products.put(4, new Product(4, "dep", 2000, "new Iphone Xx", "Iphone"));
        products.put(5, new Product(5, "one one", 2000, "new Iphone Xx", "Iphone"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public List<Product> searchName(String name) {
        List<Product> search = new ArrayList<>();
        for (Product product : products.values()) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                search.add(product);
            }
        }
        return search;
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
