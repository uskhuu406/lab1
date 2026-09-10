# Өгөгдлийн сангийн нормчлол

## Сэдэв

**Түргэн хоолны газрын захиалга, борлуулалтын систем**

Өгөгдлийн давхардлыг багасгахын тулд 0NF-ээс 3NF хүртэл нормчлол хийсэн.

---

## 0NF

Эхэндээ бүх мэдээллийг нэг хүснэгтэд хадгалсан.

| order_id | customer | employee | product_name | quantity |
| -------- | -------- | -------- | ------------ | -------- |
| 1001     | Bat      | Bold     | Burger, Cola | 2, 1     |

Нэг нүдэнд олон утга байгаа тул нормчлоогүй бүтэц.

---

## 1NF

Нэг нүдэнд нэг утга байхаар бүтээгдэхүүн бүрийг тусдаа мөр болгосон.

| order_id | customer | employee | product_name | quantity |
| -------- | -------- | -------- | ------------ | -------- |
| 1001     | Bat      | Bold     | Burger       | 2        |
| 1001     | Bat      | Bold     | Cola         | 1        |

Гэхдээ хэрэглэгч, ажилтан зэрэг мэдээлэл давтагдсан хэвээр байна.

---

## 2NF

Захиалга болон бүтээгдэхүүний мэдээллийг тусад нь салгасан.

```text
Orders
Product
OrderDetail
```

`OrderDetail` нь захиалга болон бүтээгдэхүүнийг хооронд нь холбоно.

---

## 3NF

Дам хамааралтай мэдээллүүдийг тусдаа хүснэгтэд салгасан.

Жишээ:

```text
product_id → category_id → category_name
employee_id → branch_id → branch_name
```

Тиймээс Category болон Branch хүснэгтийг тусад нь үүсгэсэн.

`Orders` хүснэгтэд `employee_id` байгаа тул `branch_id`-г давхар хадгалахгүй.

---

## Эцсийн хүснэгтүүд

1. Category
2. Product
3. Customer
4. Branch
5. Employee
6. Orders
7. OrderDetail
8. Payment

---

## Гол холбоосууд

```text
Category 1 ---- N Product
Branch 1 ---- N Employee
Customer 1 ---- N Orders
Employee 1 ---- N Orders
Orders 1 ---- N OrderDetail
Product 1 ---- N OrderDetail
Orders 1 ---- N Payment
```

`Orders` болон `Product`-ийн M:N холбоог `OrderDetail` хүснэгтээр шийдсэн.

---

## Дүгнэлт

0NF-ээс 3NF хүртэл нормчлол хийснээр өгөгдлийн давхардал багасч, нийт 8 хүснэгттэй зөв бүтэцтэй өгөгдлийн сан болсон.
