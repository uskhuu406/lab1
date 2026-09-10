# Fast Food Database System

## Сэдэв

**Түргэн хоолны газрын захиалга, борлуулалтын систем**

## Системийн зорилго

Энэхүү өгөгдлийн сангийн зорилго нь түргэн хоолны газрын
захиалга болон борлуулалтын мэдээллийг зохион байгуулж хадгалах юм.
Системд:

- бүтээгдэхүүн
- бүтээгдэхүүний ангилал
- хэрэглэгч
- салбар
- ажилтан
- захиалга
- захиалгын бүтээгдэхүүн
- төлбөр
  гэсэн мэдээллүүдийг хадгална.

## Ашигласан DBMS

**MySQL 8.4**
MySQL-ийг сонгосон шалтгаан:

- Relational Database Management System
- Primary Key болон Foreign Key дэмждэг
- Transaction дэмждэг
- Constraint ашиглан өгөгдлийн бүрэн бүтэн байдлыг хамгаалдаг
- User болон permission удирдах боломжтой
- VIEW ашиглах боломжтой

## Өгөгдлийн сангийн хүснэгтүүд

Өгөгдлийн сан нийт 8 хүснэгттэй.

1. Category
2. Product
3. Customer
4. Branch
5. Employee
6. Orders
7. OrderDetail
8. Payment

## Файлын бүтэц

```text
lab1/
├── README.md
├── normalization.md
├── erd.md
└── sql/
    ├── 1_create_database.sql
    ├── 2_create_tables.sql
    ├── 3_insert_data.sql
    ├── 4_join_queries.sql
    └── 5_dbms.sql
```

## Файлуудын тайлбар

- `normalization.md` — 0NF-ээс 3NF хүртэлх нормчлол
- `erd.md` — хүснэгтүүдийн ER Diagram
- `1_create_database.sql` — database үүсгэх
- `2_create_tables.sql` — хүснэгтүүд үүсгэх
- `3_insert_data.sql` — жишээ өгөгдөл оруулах
- `4_join_queries.sql` — хүснэгтүүдийг JOIN хийж шалгах
- `5_dbms.sql` — DBMS-ийн 10 үндсэн функцийг турших

## Ажиллуулах дараалал

SQL файлуудыг дараах дарааллаар ажиллуулна.

```text
1_create_database.sql
2_create_tables.sql
3_insert_data.sql
4_join_queries.sql
5_dbms.sql
```

## Нормчлол

Өгөгдлийг 0NF-ээс 3NF хүртэл нормчилсон.

Нормчлолын дэлгэрэнгүй тайлбар:

`normalization.md`

## ER Diagram

Хүснэгтүүдийн холбоог ER Diagram-аар харуулсан.

`erd.md`
