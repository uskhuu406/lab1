# ER Diagram

```mermaid
erDiagram

    CATEGORY ||--o{ PRODUCT : has
    BRANCH ||--o{ EMPLOYEE : has
    CUSTOMER ||--o{ ORDERS : places
    EMPLOYEE ||--o{ ORDERS : handles
    ORDERS ||--o{ ORDER_DETAIL : contains
    PRODUCT ||--o{ ORDER_DETAIL : included
    ORDERS ||--o{ PAYMENT : has

    CATEGORY {
        INT category_id PK
        VARCHAR category_name
    }

    PRODUCT {
        INT product_id PK
        VARCHAR product_name
        INT category_id FK
        DECIMAL price
        INT stock_quantity
    }

    CUSTOMER {
        INT customer_id PK
        VARCHAR customer_name
        VARCHAR phone
    }

    BRANCH {
        INT branch_id PK
        VARCHAR branch_name
        VARCHAR address
    }

    EMPLOYEE {
        INT employee_id PK
        VARCHAR employee_name
        INT branch_id FK
    }

    ORDERS {
        INT order_id PK
        DATETIME order_date
        INT customer_id FK
        INT employee_id FK
        VARCHAR status
    }

    ORDER_DETAIL {
        INT order_detail_id PK
        INT order_id FK
        INT product_id FK
        INT quantity
        DECIMAL unit_price
    }

    PAYMENT {
        INT payment_id PK
        INT order_id FK
        VARCHAR payment_method
        DECIMAL payment_amount
        DATETIME payment_date
    }
```

## Гол холбоосууд

- Category 1:N Product
- Branch 1:N Employee
- Customer 1:N Orders
- Employee 1:N Orders
- Orders 1:N OrderDetail
- Product 1:N OrderDetail
- Orders 1:N Payment

`Orders` болон `Product`-ийн M:N холбоог `OrderDetail` хүснэгтээр шийдсэн.
