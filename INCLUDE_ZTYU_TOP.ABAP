*&---------------------------------------------------------------------*
*& Include          ZTYU_TOP
*&---------------------------------------------------------------------*

"Header Tablom
TABLES zab_bill_thead.

"Item Tablom
TABLES zab_bill_titem.

"Template File İçin selection screen butonu tanımlaması.
TABLES sscrfields.

" Örnek excel dosyası için internal tablo ve Structure yapısı.
DATA : lt_excel_format TYPE TABLE OF zab_bill_excel_t WITH HEADER LINE,
       ls_excel_format TYPE zab_bill_excel_t.

"SSCRFIELDS İÇİN GEREKLİ FONKSİYON KEY TANIMLAMASI 'FC01'.
SELECTION-SCREEN : FUNCTION KEY 1.

"fieldcat için tablo ve structure tanımlamaları.
DATA : gt_fcat   TYPE lvc_t_fcat,
       gs_fcat   TYPE lvc_s_fcat,
       gs_layout TYPE lvc_s_layo.

  "EXCEL DEĞİŞİMLERİ İÇİN SAYICI.
TYPES : BEGIN OF ty_sayici,
          gv_append_sayici_h       TYPE int2,
          gv_append_sayici_i       TYPE int2,
          gv_modify_sayici_i       TYPE int2,
          gv_modify_sayici_h       TYPE int2,
          gv_degistirilmeyen_satir TYPE int2,
        END OF ty_sayici.

DATA : gs_sayici TYPE ty_sayici.


"REUSE ALV İÇİN TOP OF PAGE DEĞİŞKENLERİ
DATA : lt_list TYPE slis_t_listheader,
       ls_list TYPE slis_listheader.


"REUSE ALV EVENTS  TANIMLAMASI(END OF PAGE ICIN)
DATA : gt_events TYPE slis_t_event,
       gs_event  TYPE slis_alv_event.




"REPTEXT UZUNLUĞUNA GÖRE ALV BAŞLIKLARINI DÜZENLEDİĞİM DEĞİŞKEN
DATA    gv_reptext TYPE i.

"POP-UP EKRANINDAN DONEN VERİYİ TUTUYOR
DATA popup_return(1) TYPE c.

*----------------------------------------------------------------------------------
* Not: Structure Tanımlamalarımı Dictionary İçerisinden yaptım.
* Header Tablosu için DDIC structure ismi: zab_bill_thead_s
* Item Tablosu için DDIC structure ismi: zab_bill_titem_s
*----------------------------------------------------------------------------------

"DDIC tablodan internal tabloya aktarım için gerekli internal tablo tanımlamaları.
DATA : gt_faturat_head TYPE STANDARD TABLE OF zab_bill_thead,
       gt_faturat_item TYPE STANDARD TABLE OF zab_bill_titem,
       gs_faturat_head TYPE  zab_bill_thead,
       gs_faturat_item TYPE  zab_bill_titem.


"Excelden gelen veriyi Structuredan Tabloya Aktarmak İçin Kullanılan tanımlamalar.
DATA : gt_faturat_excel TYPE STANDARD TABLE OF zab_bill_excel_t,
       gs_faturat_excel TYPE zab_bill_excel_t.


"Excelden gelen veriyi Bölmek için
DATA : gs_faturat_hexcel TYPE  zab_bill_thead_s,
       gs_faturat_iexcel TYPE  zab_bill_titem_s.


"Excel Verisinin LT_FILE'dan alınıp DDIC'de tanımlanan structure tipinde tutulduğu tanımlamaları.
DATA : gt_faturat_excel_s TYPE STANDARD TABLE OF zab_bill_excel,
       gs_faturat_excel_s TYPE zab_bill_excel.


"DDIC TABLODAN ALV'ye GEÇERKEN GEREKLİ OLAN  STRUCTURE TANIMLAMALARI
DATA : gt_faturat_head_s TYPE STANDARD TABLE OF zab_bill_thead_s,
       gt_faturat_item_s TYPE STANDARD TABLE OF zab_bill_titem_s,
       gs_faturat_head_s TYPE zab_bill_thead_s,
       gs_faturat_item_s TYPE zab_bill_titem_s.


"Join için gerekli structure tanımlamaları(alvye basmak için)
DATA : lt_fatura_detay_s TYPE STANDARD TABLE OF zab_bill_join_s,
       ls_fatura_detay_s TYPE zab_bill_join_s.

"Join için gerekli Tablo tanımlamaları
DATA : lt_fatura_detay TYPE STANDARD TABLE OF zab_bill_join,
       ls_fatura_detay TYPE zab_bill_join.
