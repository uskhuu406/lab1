# Өгөгдлийн сангийн нормчлол

## Сэдэв

**Түргэн хоолны газрын захиалга, борлуулалтын систем**
Энэ системийн өгөгдлийг зөв зохион байгуулж, мэдээллийн давхардлыг багасгахын тулд 0NF-ээс 3NF хүртэл нормчлол хийсэн.
Нормчлол хийхдээ эхлээд бүх мэдээллийг нэг хүснэгтэд оруулж, дараа нь мэдээллүүдийн хамаарлыг харж хүснэгтүүдэд салгасан.

---

# 1. 0NF - Нормчлоогүй хүснэгт

Эхлээд захиалгатай холбоотой бүх мэдээллийг нэг хүснэгтэд хадгалсан.

| order_id | order_date | customer_name | customer_phone | employee_name | branch_name | product_name | category_name | quantity | price       | payment_method |
| -------- | ---------- | ------------- | -------------- | ------------- | ----------- | ------------ | ------------- | -------- | ----------- | -------------- |
| 1        | 2026-09-09 | galaa         | 9999           | Berh          | Sukhbaatar  | Burger, Cola | Burger, Drink | 2, 1     | 12000, 3500 | Card           |

## Асуудал

Энэ хүснэгтэд нэг нүдэнд олон утга орсон байна.
Жишээ нь:

- `product_name = Burger, Cola`
  Нэг нүдэнд олон бүтээгдэхүүний мэдээлэл хадгалж байгаа учраас мэдээллийг хайх, өөрчлөх, устгахад хүндрэлтэй.

---

# 2. 1NF - First Normal Form

1NF-ийн үндсэн дүрэм нь:
**Нэг нүдэнд нэг л утга байна.**

0NF дээр нэг нүдэнд байсан бүтээгдэхүүнүүдийг тусдаа мөр болгосон.

| order_id | order_date | customer_name | customer_phone | employee_name | branch_name | product_name | category_name | quantity | price | payment_method |
| -------- | ---------- | ------------- | -------------- | ------------- | ----------- | ------------ | ------------- | -------- | ----- | -------------- |
| 1        | 2026-09-09 | galaa         | 9999           | Bold          | Sukhbaatar  | Burger       | Burger        | 2        | 12000 | Card           |
| 1        | 2026-09-09 | galaa         | 9999           | Bold          | Sukhbaatar  | cola         | cola          | 1        | 1000  | Card           |

Одоо нэг нүдэнд нэг л утга байгаа учраас 1NF-ийн шаардлагыг хангаж байна.
Гэхдээ мэдээллийн давхардал хэвээр байна.

---

# 3. Functional Dependency

Дараагийн шатанд аль мэдээлэл аль ID-аас хамаарч байгааг тодорхойлсон.

- `order_id →` order_date, customer_id, employee_id, branch_id
- `customer_id →` customer_name, phone
- `product_id →` product_name, category_id, price, stock_quantity
- `category_id →` category_name
- `employee_id →` employee_name, branch_id
- `branch_id →` branch_name, address
- `(order_id, product_id) →` quantity, unit_price
- `payment_id →` order_id, payment_method, payment_amount, payment_date

````
Жишээ нь:

`customer_id`-г мэдэж байвал тухайн хэрэглэгчийн нэр болон
утасны дугаарыг мэдэж болно.

```text
customer_id → customer_name, phone
````

Мөн `product_id`-г мэдэж байвал бүтээгдэхүүний нэр, ангилал,
үнэ болон үлдэгдлийг мэдэж болно.

```text
product_id → product_name, category_id, price, stock_quantity
```

Нэг захиалгад ямар бүтээгдэхүүн хэдэн ширхэг орсныг тодорхойлоход
`order_id` болон `product_id` хоёулаа хэрэгтэй.

```text
(order_id, product_id) → quantity, unit_price
```

Эдгээр хамаарлыг ашиглан дараагийн нормчлолыг хийсэн.

---

# 4. 2NF - Second Normal Form

2NF хийхдээ түлхүүрийн зөвхөн нэг хэсгээс хамаарч байгаа
мэдээллүүдийг тусад нь салгасан.

Жишээ нь:

```text
order_date → order_id-тай холбоотой
product_name → product_id-тай холбоотой
quantity → order_id болон product_id-ийн хослолтой холбоотой
```

Тиймээс захиалга, бүтээгдэхүүн болон захиалгын дэлгэрэнгүй
мэдээллийг тусдаа хүснэгт болгосон.

## Orders

Захиалгын үндсэн мэдээллийг хадгална.

| order_id | order_date | customer_id | employee_id | branch_id |
| -------- | ---------- | ----------- | ----------- | --------- |
| 1        | 2026-09-09 | 1           | 1           | 1         |

## Product

Бүтээгдэхүүний мэдээллийг хадгална.

| product_id | product_name | category_id | price | stock_quantity |
| ---------- | ------------ | ----------- | ----- | -------------- |
| 1          | Burger       | 1           | 12000 | 50             |

## OrderDetail

Нэг захиалгад ямар бүтээгдэхүүн хэдэн ширхэг орсныг хадгална.

| order_detail_id | order_id | product_id | quantity | unit_price |
| --------------- | -------- | ---------- | -------- | ---------- |
| 1               | 1001     | 1          | 2        | 12000      |
| 2               | 1001     | 2          | 1        | 3500       |

Ингэснээр захиалгын мэдээлэл `Orders` хүснэгтэд,
бүтээгдэхүүний мэдээлэл `Product` хүснэгтэд хадгалагдана.

Харин захиалга болон бүтээгдэхүүн хоорондын холбоог
`OrderDetail` хүснэгт хадгална.

Жишээ нь:

```text
order_id = 1001
product_id = 1
quantity = 2
```

гэдэг нь 1001 дугаартай захиалгад 1 дугаартай бүтээгдэхүүн
2 ширхэг орсон гэсэн үг.

---

# 5. 3NF - Third Normal Form

2NF хийсний дараа зарим мэдээлэл өөр баганаар дамжин
хамааралтай хэвээр байсан.

Жишээ нь:

```text
product_id → category_id → category_name
```

Product хүснэгтэд `category_name`-ийг шууд хадгалбал нэг ангиллын
нэр олон бүтээгдэхүүн дээр давтагдана.

Тиймээс Category хүснэгтийг тусад нь гаргасан.

Мөн:

```text
customer_id → customer_name, phone
```

учраас хэрэглэгчийн мэдээллийг Customer хүснэгтэд салгасан.

```text
branch_id → branch_name, address
```

учраас салбарын мэдээллийг Branch хүснэгтэд салгасан.

```text
employee_id → employee_name, branch_id
```

учраас ажилтны мэдээллийг Employee хүснэгтэд салгасан.

Төлбөрийн мэдээллийг мөн захиалгын үндсэн хүснэгтэд хадгалахгүйгээр
Payment хүснэгтэд тусад нь хадгалсан.

Ингээд 3NF хийсний дараа нийт 8 хүснэгттэй болсон.

---

# 6. Эцсийн хүснэгтүүд

## 6.1 Category

Бүтээгдэхүүний ангиллын мэдээллийг хадгална.

| Column        | Key | Тайлбар      |
| ------------- | --- | ------------ |
| category_id   | PK  | Ангиллын ID  |
| category_name |     | Ангиллын нэр |

---

## 6.2 Product

Бүтээгдэхүүний мэдээллийг хадгална.

| Column         | Key | Тайлбар            |
| -------------- | --- | ------------------ |
| product_id     | PK  | Бүтээгдэхүүний ID  |
| product_name   |     | Бүтээгдэхүүний нэр |
| category_id    | FK  | Ангиллын ID        |
| price          |     | Бүтээгдэхүүний үнэ |
| stock_quantity |     | Үлдэгдэл           |

Холбоо:

```text
Product.category_id → Category.category_id
```

---

## 6.3 Customer

Хэрэглэгчийн мэдээллийг хадгална.

| Column        | Key | Тайлбар          |
| ------------- | --- | ---------------- |
| customer_id   | PK  | Хэрэглэгчийн ID  |
| customer_name |     | Хэрэглэгчийн нэр |
| phone         |     | Утасны дугаар    |

---

## 6.4 Branch

Салбарын мэдээллийг хадгална.

| Column      | Key | Тайлбар       |
| ----------- | --- | ------------- |
| branch_id   | PK  | Салбарын ID   |
| branch_name |     | Салбарын нэр  |
| address     |     | Салбарын хаяг |

---

## 6.5 Employee

Ажилтны мэдээллийг хадгална.

| Column        | Key | Тайлбар               |
| ------------- | --- | --------------------- |
| employee_id   | PK  | Ажилтны ID            |
| employee_name |     | Ажилтны нэр           |
| branch_id     | FK  | Ажилладаг салбарын ID |

Холбоо:

```text
Employee.branch_id → Branch.branch_id
```

---

## 6.6 Orders

Захиалгын үндсэн мэдээллийг хадгална.

| Column      | Key | Тайлбар         |
| ----------- | --- | --------------- |
| order_id    | PK  | Захиалгын ID    |
| order_date  |     | Захиалгын огноо |
| customer_id | FK  | Хэрэглэгчийн ID |
| employee_id | FK  | Ажилтны ID      |
| branch_id   | FK  | Салбарын ID     |
| status      |     | Захиалгын төлөв |

Холбоонууд:

```text
Orders.customer_id → Customer.customer_id

Orders.employee_id → Employee.employee_id

Orders.branch_id → Branch.branch_id
```

---

## 6.7 OrderDetail

Захиалгад орсон бүтээгдэхүүнүүдийн мэдээллийг хадгална.

| Column          | Key | Тайлбар                   |
| --------------- | --- | ------------------------- |
| order_detail_id | PK  | Дэлгэрэнгүй мэдээллийн ID |
| order_id        | FK  | Захиалгын ID              |
| product_id      | FK  | Бүтээгдэхүүний ID         |
| quantity        |     | Тоо хэмжээ                |
| unit_price      |     | Тухайн үеийн нэгж үнэ     |

Холбоонууд:

```text
OrderDetail.order_id → Orders.order_id

OrderDetail.product_id → Product.product_id
```

---

## 6.8 Payment

Захиалгын төлбөрийн мэдээллийг хадгална.

| Column         | Key | Тайлбар          |
| -------------- | --- | ---------------- |
| payment_id     | PK  | Төлбөрийн ID     |
| order_id       | FK  | Захиалгын ID     |
| payment_method |     | Төлбөрийн хэлбэр |
| payment_amount |     | Төлбөрийн дүн    |
| payment_date   |     | Төлбөрийн огноо  |

Холбоо:

```text
Payment.order_id → Orders.order_id
```

---

# 7. Хүснэгтүүдийн холбоо

Эцсийн хүснэгтүүд дараах байдлаар хоорондоо холбогдоно.

```text
Category 1 ---- N Product

Branch 1 ---- N Employee

Customer 1 ---- N Orders

Employee 1 ---- N Orders

Branch 1 ---- N Orders

Orders 1 ---- N OrderDetail

Product 1 ---- N OrderDetail

Orders 1 ---- N Payment
```

Жишээ нь:

Нэг Category-д олон Product байж болно.

```text
Category 1 ---- N Product
```

Нэг Customer олон захиалга хийж болно.

```text
Customer 1 ---- N Orders
```

Нэг Orders дотор олон бүтээгдэхүүн орж болох учраас:

```text
Orders 1 ---- N OrderDetail
```

гэсэн холбоотой.

Product болон Orders нь шууд холбогдохгүй.
Тэдгээрийг `OrderDetail` хүснэгт хооронд нь холбож байна.

---

# 8. Primary Key болон Foreign Key

## Primary Key

Primary Key нь хүснэгтийн мөр бүрийг давтагдахгүйгээр
тодорхойлоход ашиглагдана.

Манай хүснэгтүүдийн Primary Key:

```text
Category      → category_id
Product       → product_id
Customer      → customer_id
Branch        → branch_id
Employee      → employee_id
Orders        → order_id
OrderDetail   → order_detail_id
Payment       → payment_id
```

## Foreign Key

Foreign Key нь хүснэгтүүдийг хооронд нь холбоход ашиглагдана.

Манай системийн Foreign Key-үүд:

```text
Product.category_id
    → Category.category_id

Employee.branch_id
    → Branch.branch_id

Orders.customer_id
    → Customer.customer_id

Orders.employee_id
    → Employee.employee_id

Orders.branch_id
    → Branch.branch_id

OrderDetail.order_id
    → Orders.order_id

OrderDetail.product_id
    → Product.product_id

Payment.order_id
    → Orders.order_id
```

---

# 9. Бизнес дүрэм

Өгөгдөл буруу орохоос хамгаалахын тулд дараах дүрмүүдийг
ашигласан.

```text
price > 0

quantity > 0

unit_price > 0

stock_quantity >= 0

payment_amount > 0
```

Мөн:

- Бүтээгдэхүүн нэг ангилалд харьяалагдана.
- Ажилтан нэг салбарт харьяалагдана.
- Захиалга хэрэглэгчтэй холбоотой байна.
- Захиалгыг ажилтан хариуцна.
- Захиалга салбартай холбоотой байна.
- Нэг захиалгад олон бүтээгдэхүүн орж болно.
- Нэг бүтээгдэхүүн олон захиалгад орж болно.

---
