# өгөгдлийн сангийн норомчлол

# 0NF-норомчлоогүй хүснэгт

| order_id | customer_name | product_name | quantity | price      |
| -------- | ------------- | ------------ | -------- | ---------- |
| 1        | galaa         | kebab,cola   | 5,8      | 32000,3500 |

## 0NF-ийн асуудал

Нэг нүдэнд олон утга агуулагдаж байна.
Жишээ :
product_name = kebab, cola
Нэг нүдэнд олон мэдээлэл байх нь өгөгдөл хайх засхад хүндрэлтэй
Тиимээч 1NF хийж нэг нүдэнд нэг л утга хадгална.

# 1NF-Fisrt Normal Form

**дүрэм : нэг нүдэнд нэг л утга байна.**
|order_id|order_date|customer_name|customer_phone|employee_name|branch_name|product_name|category_name|quentity|price|payment_method|
|---|---|---|---|---|---|---|---|---|---|---|
|1|2026-09-09|galaa|99999999|galaa|sukhbaatar|burger|main|2|12000|card|
|№|2026-09-09|galaa|9999999|galaa|sukhbaatar|Cola|drink|1| 3500 |card|

## 1NF-ийн үр дүн

Одоо нэг нүдэнд нэг л мэдээлэл байна.
Гэхдээ давхардал байна.
Жишээ:
order_id=1 захиалгийн нэр, утас...гэх мэт зүйлс бүтээгдэхүүн бүрийн мөр дээр давтагдаж байна.
Тиймээс дараагийн шатанд өгөгдлийг хамаарлийг тодорхойлж хүснэгтийг салган.

# Functional Dependency-Өгөгдлийн хамаарал

Аль мэдээлэл аль ID-аас хамаарч байгааг тодорхойлов.

### захиалаг

`order_id->order_date,customer_id,employee_id,branch_id`
order_id гаар тухайн захиалгийн огноо ,хэрэглэгч, ажилтан ,салбарыг тодорхойлж болно

### Хэрэглэгч

`customer_id->customer_name,phone`
Хэрэглэгчийн ID-аар нэр болон утасны дугаарыг тодорхойлно.

### Бүтээгдэхүүн

`product_id->product_name,category_id,price,stock_quantity`
Нэг бүтээгдэхүүн id-гаар бүтээгдэхүүний нэр ,ангилал , үнэ болон , үлдэгдлийг тодорхойлон,

### ангилал

`category_id->category_name`
id-гаар ангилалын нэрийг тодорхойлон.

### Ажилтан

`employee_id → employee_name, branch_id`
Нэг ажилтны ID-аар ажилтны нэр болон ажилладаг салбарыг тодорхойлно.

### Салбар

`branch_id → branch_name, address`
Нэг салбарын ID-аар салбарын нэр болон хаягийг тодорхойлно.

### Захиалгын бүтээгдэхүүн

`(order_id, product_id) → quantity, unit_price`
Нэг захиалгад орсон бүтээгдэхүүний тоо хэмжээ болон тухайн үеийн
борлуулалтын үнийг тодорхойлно.

# 2NF -Second Normal Form

2NF-ийн зорилго нь partial dependency буюу түлхүүрийн зөвхөн нэг хэсгээс хамаарсан мэдээллийг салгах юм.

## Orders

| order_id PK | order_date | customer_id | employee_id | branch_id |
| ----------- | ---------- | ----------- | ----------- | --------- |

---

## Product

| product_id PK | product_name | category_id | price | stock_quantity |
| ------------- | ------------ | ----------- | ----- | -------------- |

---

## OrderDetail

| order_detail_id PK | order_id FK | product_id FK | quantity | unit_price |
| ------------------ | ----------- | ------------- | -------- | ---------- |

---

## 2NF-ийн үр дүн

Захиалгын мэдээлэл `Orders` хүснэгтэд,
бүтээгдэхүүний мэдээлэл `Product` хүснэгтэд,
харин захиалга болон бүтээгдэхүүний холбоо `OrderDetail` хүснэгтэд
хадгалагдана.

Ингэснээр partial dependency багасна.

# 3NF — Third Normal Form

3NF-ийн зорилго нь transitive dependency буюу түлхүүр биш багана
өөр түлхүүр биш баганаас дамжин хамаарах хамаарлыг арилгах юм.

## 1. Category

Бүтээгдэхүүний ангиллын мэдээллийг хадгална.

| Багана        | Түлхүүр | Тайлбар      |
| ------------- | ------- | ------------ |
| category_id   | PK      | Ангиллын ID  |
| category_name |         | Ангиллын нэр |

---

## 2. Product

Бүтээгдэхүүний мэдээллийг хадгална.

| Багана         | Түлхүүр | Тайлбар            |
| -------------- | ------- | ------------------ |
| product_id     | PK      | Бүтээгдэхүүний ID  |
| product_name   |         | Бүтээгдэхүүний нэр |
| category_id    | FK      | Ангиллын ID        |
| price          |         | Үнэ                |
| stock_quantity |         | Үлдэгдэл           |

`Product.category_id → Category.category_id`

---

## 3. Customer

Хэрэглэгчийн мэдээллийг хадгална.

| Багана        | Түлхүүр | Тайлбар          |
| ------------- | ------- | ---------------- |
| customer_id   | PK      | Хэрэглэгчийн ID  |
| customer_name |         | Хэрэглэгчийн нэр |
| phone         |         | Утасны дугаар    |

---

## 4. Branch

Түргэн хоолны газрын салбаруудын мэдээллийг хадгална.

| Багана      | Түлхүүр | Тайлбар       |
| ----------- | ------- | ------------- |
| branch_id   | PK      | Салбарын ID   |
| branch_name |         | Салбарын нэр  |
| address     |         | Салбарын хаяг |

---

## 5. Employee

Ажилтны мэдээллийг хадгална.

| Багана        | Түлхүүр | Тайлбар          |
| ------------- | ------- | ---------------- |
| employee_id   | PK      | Ажилтны ID       |
| employee_name |         | Ажилтны нэр      |
| branch_id     | FK      | Ажилладаг салбар |

`Employee.branch_id → Branch.branch_id`

---

## 6. Orders

Захиалгын үндсэн мэдээллийг хадгална.

| Багана      | Түлхүүр | Тайлбар                  |
| ----------- | ------- | ------------------------ |
| order_id    | PK      | Захиалгын ID             |
| order_date  |         | Захиалгын огноо          |
| customer_id | FK      | Захиалга өгсөн хэрэглэгч |
| employee_id | FK      | Захиалга авсан ажилтан   |
| branch_id   | FK      | Захиалга авсан салбар    |
| status      |         | Захиалгын төлөв          |

`Orders.customer_id → Customer.customer_id`

`Orders.employee_id → Employee.employee_id`

`Orders.branch_id → Branch.branch_id`

---

## 7. OrderDetail

Нэг захиалгад ямар бүтээгдэхүүн хэдэн ширхэг орсныг хадгална.

| Багана          | Түлхүүр | Тайлбар                      |
| --------------- | ------- | ---------------------------- |
| order_detail_id | PK      | Захиалгын дэлгэрэнгүй ID     |
| order_id        | FK      | Захиалгын ID                 |
| product_id      | FK      | Бүтээгдэхүүний ID            |
| quantity        |         | Тоо хэмжээ                   |
| unit_price      |         | Захиалга хийх үеийн нэгж үнэ |

`OrderDetail.order_id → Orders.order_id`

`OrderDetail.product_id → Product.product_id`

---

## 8. Payment

Захиалгын төлбөрийн мэдээллийг хадгална.

| Багана         | Түлхүүр | Тайлбар          |
| -------------- | ------- | ---------------- |
| payment_id     | PK      | Төлбөрийн ID     |
| order_id       | FK      | Захиалгын ID     |
| payment_method |         | Төлбөрийн хэлбэр |
| payment_amount |         | Төлсөн дүн       |
| payment_date   |         | Төлбөрийн огноо  |

`Payment.order_id → Orders.order_id`

---

# Эцсийн үр дүн

3NF нормчлолын дараа дараах 8 хүснэгттэй болов.

1. Category
2. Product
3. Customer
4. Branch
5. Employee
6. Orders
7. OrderDetail
8. Payment

Эдгээр хүснэгтүүд нь Primary Key болон Foreign Key ашиглан
хоорондоо холбогдоно.

## Үндсэн бизнес дүрмүүд

- Бүтээгдэхүүн заавал нэг ангилалд харьяалагдана.
- Ажилтан нэг салбарт харьяалагдана.
- Захиалга нэг хэрэглэгчтэй холбоотой байна.
- Нэг захиалгад олон бүтээгдэхүүн орж болно.
- Нэг бүтээгдэхүүн олон захиалгад орж болно.
- `price > 0`
- `quantity > 0`
- `stock_quantity >= 0`
- Төлбөр заавал захиалгатай холбоотой байна.
