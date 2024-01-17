# proje-kodlar-versiyon-FINAL
## zab_package içerisindeki zab_p70 programı üzerinden veya ZTYU programı üzerinden Projeme Erişebilirsiniz.
## EKRAN GÖRÜNTÜLERİ NET DEĞİL İSE ÜSTÜNE TIKLAYIP FARKLI BİR PENCEREDE İNCELEYEBİLİRSİNİZ...

## 1. Projede Z’li 2 adet tablo oluşturulacaktır. Bu tabloların biri header biri item tablosu olacak.



### Header Tablosu

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/524eb9ed-348a-4a71-b73e-d8a6a8fd6bb2)

### Item Tablosu

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/b29107f0-e5ca-4e1a-b41b-38132d1b7083)

## 2. Selection Screen ekranı tasarlanacaktır. Ekranda Tab Panel oluşturulacak.

- birinci Tabta - Sizin oluşturduğunuz 2 adet Z'li tablonun key alanları yer alacaktır.

![image](https://github.com/xryal/proje-kodlari-Final/assets/81656700/0ffa4a86-92fe-4534-8ccd-9ac84b97d5c6)

Burada ekstradan sadece header tablosundan da okuma yapabilmesi amacıyla Dinamik bir
ekran tasarımı yaptım, böylelikle kişi isterse hem Header(Invoice Info) hem de Header ve
Item tablosunun birleşimini(Invoice Detail Info) ALV tablosunda görebilecek şekilde bir
kurgu yapmış oldum. Farklı bir case için bu tarz Dinamik ekran yapıları kullanıcı deneyimi
açısından daha anlaşılır olacağını düşünerek böyle bir kod tasarımı yaptım

![image](https://github.com/xryal/proje-kodlari-Final/assets/81656700/19a4eea5-aa6e-4f1e-9710-e2e36d0d8983)


- İkinci Tabta - File upload  alanı olacaktır.
 
![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/7af33aa6-66ab-4e78-8bf0-54a56a042e2d)

## 3. Eğer birinci tab’daki alanlar dolu ise program rapor şeklinde çalışıp birinci tab’daki girilen değerlere göre Z’li tablolarınızdan veriyi çekerek ekrandaki ALV raporda gösterilecektir.

- Header Tablomun Verisini Çekmek İçin,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/8ea93e67-de39-4567-8db9-3cbb48be357c)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/387c2a33-016a-4b80-8483-a29d31964d0e)

- Tüm Tablolarımın joinlenmiş(birleştirilmiş) Verisini Çekmek İçin Hiçbir Giriş Yapmıyoruz,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/0c8f198c-95bb-4adc-bc3f-3c70909897ea)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/a01c447c-a569-4a78-8a43-72f50b79fdc9)

- Tüm Tablomun ilgili sayı değeri aralığındaki joinlenmiş Verisini Çekmek için fatura detay tablosunun id'sine Giriş Yapıyoruz,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/156ec5ba-5b9d-4986-a23a-d52ba5cbcb99)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/679e5d4d-58ef-4229-8150-200dd5e4ec8b)

- Tüm Tablomun ilgili sayı değeri aralığındaki joinlenmiş Verisinin spesifik malzeme bilgisini Çekmek için fatura detay tablosunun id'sine ve malzeme id'sine Giriş Yapıyoruz,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/001de267-4051-48a1-bcd4-9c42fda41e53)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/46186efd-087b-4f07-a1ad-c9c1493d0391)

- İki Tablodan değer girip veri çekmeye çalışınca uyarı vermesini sağladım.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/157650dd-446b-4706-bd20-1c811971413f)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/588901e9-0a2a-4f96-83dd-ecdc4a2dd06b)

## 4. Eğer ikinci tab’daki file upload nesnesi dolu ise file upload’a klasör adresi girilen exceldeki veriler ALV raporunda gösterilecektir.

- File Upload nesnesi boş ise bu hatayı verir,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/f35e874d-fc75-43e7-bf5d-5977b5a43b33)

- File Upload nesnesi dolu ama formatı yanlış ise bu hatayı verir,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/10f0e682-0947-46b9-9c5d-0d84184be5a4)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/fc7014eb-2fd4-4d5e-82ac-ca8d4cb454f7)

- File Upload nesnesi dolu içeriği boş ise bu hatayı verir,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/82bbf4e6-3a21-48dc-8a5f-211b9a4d32f7)

- Herşey sorunsuz ise Dosya içeriği alvye basılır,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/5111cd61-e3e3-47a4-85a2-0bb6c9f9e58c)

## 5. ALV raporun GUI statusune 3 adet buton yerleştirilecektir. Bu butonların 1.si eğer 2.tab paneldeki file upload alanındaki excel dosya yolu dolu ve exceldeki veriler ALV raporda gösteriliyor ise ALV rapordaki verileri Z’li tasarlanan 2 tabloya kayıt edecektir.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/9e81be9b-5c7d-45df-a04e-c56085ee0740)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/cd4675b7-d915-48f8-b630-4d5717ae2d3e)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/9803e82e-25bd-4c05-bcfa-0e5ce69d84d6)

a. 1. Buton

- Eğer Tab Panel 2'inci tab panel değil ise şu hatayı vermektedir.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/2bbf9ded-fd88-4d9d-aaee-37cc9a750b77)

- Eğer Tab Panel 2'inci tab panel ise verileri kaydetmeden önce Bir Pop-Up ile kullanıcı uyarılır.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/5ed6c1de-757d-4d4a-9350-399151d2d03b)

- Kaydetme işlemi başarıyla tamamlanırsa bu şekilde bilgilendirme mesajı verilmektedir.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/58232566-8d6a-49a2-b27c-e8fd6fc0cda1)

- Ve Sayıcı Tarafından değişim türü ve hangi tabloda kaç değişim olmuş gibi veriler dönderilir.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/f90201bf-33ed-4594-8962-dfbe4e78ae69)

- Veriyi tabloya tekrardan üstüne yazdığımız zaman,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/874bff00-a932-45fd-9f36-694449dae217)

- Aynı veriler database tablosunda olduğu için değişim veya ekleme işlemi yapılmamaktadır.

Örnek Senaryo:

- Header Ve item tablomuzdan bir veri seçelim,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/c1301165-67ba-420d-bc6f-ef91c028bb8f)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/0769e80c-b2ff-4098-93fb-05832e07fa11)

- Bu veriyi EXCEL dosyamıza yazıp kaydedelim,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/ad5c1f59-4b11-4c61-b997-8d486cb0a865)

- Kaydedilen veriyi tablolarımıza kayıt etmeye çalışalım aynı veri olduğu için sayıcılarda değişim olmayacaktır.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/b6b4d81b-32fc-49b5-b418-86d35eb1f2f0)

- veride değişiklikler yaparsak şayet ilgili sayıcılar o değişimleri sayıp ekrana basacaktır Örneğin Header alanından ve item alanından 1 tane alanı değiştirelim,

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/f7a3d51d-5de0-4c03-9708-85b8f0d64acd)

- Şekildeki gibi değişimler sayıcılara aktarıldı.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/a7d3b58a-c7a5-4928-83b7-b6a762d899e4)

b. 2. Buton

- ikinci butona bastığımız zaman Header tablomuza ait bakım ekranının transaction kodu çağırılmaktadır.

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/28b43980-f043-4c4a-abdd-038bd45a54f8)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/8a057289-a5fb-4518-a679-c0b34905aebe)

c. 3. Buton

- Üçüncü butona bastığımız zaman Item tablomuza ait bakım ekranının transaction kodu çağırılmaktadır.
 
![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/45c15c2b-b6f0-4f82-85f4-d4d7c529320e)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/bb7ea910-b465-42f4-a372-e278aa4b9bf9)

(Not : Excel dosyasındaki her satırda header ve item alanları olacaktır. Eğer ki program file upload boş ise kaydet butonuna basılırsa hata vermesi sağlanacaktır.)

![image](https://github.com/xryal/proje-kodlar-versiyon-15/assets/81656700/6a23a1f9-f842-49a0-a395-8f90506ad408)

EK:

Örnek excel şablonu çıktısı veren ekstra bir buton koydum projeme

![image](https://github.com/xryal/proje-kodlari-Final/assets/81656700/f803f7ea-28c9-4b8c-a617-ccda9c8ca07a)

