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

" EVENT BLOKLARI
INCLUDE ZTYU_init.
INCLUDE ZTYU_at_slc_scr_val.
INCLUDE ZTYU_at_slc_scr.
INCLUDE ZTYU_slct_scr_out.

"FPICKER FORM
INCLUDE ZTYU_fpicker.

"EXCEL FORMLARI
INCLUDE ZTYU_ULOAD_excel.
INCLUDE ZTYU_alv_excel.

"FATURA ID YE GÖRE FATURANIN HEADER TABLOSUNDAN VERİYİ ÇEKİP ALVYE BASAN MODÜL
INCLUDE ZTYU_ddic_to_alv.

"GUI-STATUS MODÜLÜ
INCLUDE ZTYU_pf_status_set.

"Template EXCEL File İçin.
INCLUDE ZTYU_file_template.

"TABLOLARA YAZMADAN ÖNCE ÇIKAN POP-UP EKRANI
INCLUDE ZTYU_POP_UP.

"HEADER TABLOSU ICIN TOP OF PAGE.
INCLUDE ZTYU_TOP_OF_PAGE.

"EXCEL TABLOSU İÇİN COUNTERLARIN OLDUĞU END OF LIST YAPISI.
INCLUDE ZTYU_END_OF_LIST.
