*&---------------------------------------------------------------------*
*& Report ZTYU
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTYU.

"DECLARATION
INCLUDE ZTYU_top.

"LAYOUT
INCLUDE ZTYU_lout.

"EVENT BLOKLARI
INCLUDE ZTYU_init.
INCLUDE ZTYU_at_slc_scr_val.
INCLUDE ZTYU_at_slc_scr.
INCLUDE ZTYU_slct_scr_out.
INCLUDE ZTYU_STR_OF_SEL.

"FPICKER FORM
INCLUDE ZTYU_fpicker.

"EXCEL FORMLARI
INCLUDE ZTYU_ULOAD_excel.
INCLUDE ZTYU_alv_excel.

"TABLODAN  VERİYİ ÇEKİP ALVYE BASAN FORMLAR
INCLUDE ZTYU_ddic_to_alv.

"GUI-STATUS MODÜLÜ
INCLUDE ZTYU_pf_status_set.

"Template EXCEL File OLUŞTURAN MODÜL
INCLUDE ZTYU_file_template.

"TABLOLARA YAZMADAN ÖNCE ÇIKAN POP-UP EKRANI
INCLUDE ZTYU_POP_UP.

"HEADER TABLOSU ICIN TOP OF PAGE FORMLARI
INCLUDE ZTYU_TOP_OF_PAGE.

"EXCEL TABLOSU İÇİN COUNTERLARIN OLDUĞU END OF LIST FORMU.
INCLUDE ZTYU_END_OF_LIST.
