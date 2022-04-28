create database proje_market_vt
use proje_market_vt

create table tbl_personel_bilgi(
personel_tc int primary key,
personel_ad varchar (50),
personel_soyad varchar (50),
personel_cinsiyet bit,
personel_dogum_tarihi date, 
personel_maas money
)
create table tbl_kasa_bilgi(
kasa_id int primary key identity,
kasa_no int,
)
create table tbl_kasiyer_bilgi(
kasiyer_tc int primary key ,
kasiyer_ad varchar(50),
kasiyer_soyad varchar(50),
kasiyer_cinsiyet bit,
kasiyer_dogum_tarihi date,
)
create table tbl_kasa_kasiyer(
kasa_kasiyer_id int primary key identity,
kasa_id_fk int foreign key references tbl_kasa_bilgi(kasa_id),
kasiyer_id_fk int foreign key references tbl_kasiyer_bilgi(kasiyer_tc)
)
create table tbl_musteri_bilgi(
musteri_id int primary key,
musteri_ad varchar(50),
musteri_soyad varchar(50),
musteri_tel_no varchar(11),
musteri_dogum_tarihi date,
musteri_cinsiyet bit
)
create table tbl_iletisim_bilgi(
iletisim_id int primary key identity,
tel_no varchar(11),
mail_adresi varchar(100)
)
create table tbl_musteri_iletisim(
musteri_iletisim_id int primary key identity,
iletisim_id_fk int foreign key references tbl_iletisim_bilgi(iletisim_id),
musteri_id_fk int foreign key references tbl_musteri_bilgi(musteri_id)
)
create table tbl_adres_bilgi(
adres_id int primary key identity,
adres_basligi varchar(100),
adres varchar(400)
)
create table tbl_musteri_adres(
musteri_adres_id int primary key identity,
adres_id_fk int foreign key references tbl_adres_bilgi(adres_id),
musteri_id_fk int foreign key references tbl_musteri_bilgi(musteri_id)
)
create table tbl_arac_bilgi(
arac_id int primary key identity,
arac_plaka varchar(20),
arac_marka varchar(50)
)
create table tbl_urun_bilgi(
urun_id int primary key identity,
urun_ad varchar(100),
urun_adedi int,
urun_stok int,
urun_fiyat money
)
create table tbl_reyon_bilgi(
reyon_id int primary key identity,
reyon_no int,
reyon_ad varchar(100),
)
create table tbl_urun_reyon(
urun_reyon_id int primary key identity,
urun_id_fk int foreign key references tbl_urun_bilgi(urun_id),
reyon_id_fk int foreign key references tbl_reyon_bilgi(reyon_id)
)
create table tbl_sepet_bilgi(
sepet_id int primary key identity,
)
create table tbl_urun_sepet(
urun_sepet_id int primary key identity,
urun_id_fk int foreign key references tbl_urun_bilgi(urun_id),
sepet_id_fk int foreign key references tbl_sepet_bilgi(sepet_id)
)
create table tbl_siparis_bilgi(
siparis_id int primary key identity,
siparis_sepet_urunler_fk int foreign key references tbl_urun_sepet,
siparis_arac_fk int foreign key references tbl_arac_bilgi(arac_id),
siparis_getirme_ucreti money,
siparis_fiyat money
)