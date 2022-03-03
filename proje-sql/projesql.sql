CREATE DATABASE proje_market_vt



CREATE TABLE tbl_personel_bilgileri(
personel_id int primary key identity,
personel_ad varchar (50),
personel_soyad varchar (50),
personel_cinsiyet bit,
personel_tc varchar (11),
personel_dogum_tarihi date
)

CREATE TABLE tbl_personel_iletisim_bilgileri(
personel_iletisim_id int foreign key references tbl_personel_bilgileri(personel_id),
personel_telefon varchar (11),
personel_mail_adresi varchar (55),
personel_ev_adresi varchar(75),
personel_posta_kodu varchar(5)
)
