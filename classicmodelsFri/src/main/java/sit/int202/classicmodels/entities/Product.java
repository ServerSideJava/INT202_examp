package sit.int202.classicmodels.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "products")
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "PRODUCT.FIND.ALL", query = "SELECT p FROM Product p"),
        @NamedQuery(name = "PRODUCT.COUNT", query = "SELECT COUNT (p) as count FROM Product p")
})

public class Product {
    @Id
    private String productCode;
    private String productName;
    private String productLine;
    private String productScale;
    private String productVendor;
    private String productDescription;
    private Integer quantityInStock;
    private Double buyPrice;
    // MSRP Manufacturer Suggestion Retail Price
    @Column (name = "MSRP")
    private Double Price;
}
