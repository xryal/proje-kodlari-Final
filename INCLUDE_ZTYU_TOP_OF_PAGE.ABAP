*&---------------------------------------------------------------------*
*& Include          ZTYU_TOP_OF_PAGE
*&---------------------------------------------------------------------*

FORM top_of_page.

  REFRESH lt_list.

  DATA: lv_kullanici(50) TYPE c,
        lv_program(50)   TYPE c,
        lv_saat(50)      TYPE c,
        lv_lines(50)     TYPE c.

  CLEAR ls_list.
  ls_list-typ = 'H'.
  ls_list-info = 'Fatura Header Tablosu'.
  APPEND ls_list TO lt_list.

  lv_kullanici = sy-uname.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Kullanici : '.
  ls_list-info = lv_kullanici .
  APPEND ls_list TO lt_list.

  lv_program = sy-repid.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Program Adı : '.
  ls_list-info = lv_program .
  APPEND ls_list TO lt_list.

  lv_saat = sy-uzeit.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Sistem Saati : '.
  CONCATENATE lv_saat+0(2) ':' lv_saat+2(2) ':' lv_saat+4(2) INTO lv_saat.
  ls_list-info = lv_saat.
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  DESCRIBE TABLE gt_faturat_head_s LINES lv_lines.
  ls_list-typ = 'S'.
  ls_list-key = 'Toplam Kayıt : '.
  ls_list-info = lv_lines.
  APPEND ls_list TO lt_list.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_list.
ENDFORM.

*&---------------------------------------------------------------------*
*& Include          ZTYU_TOP_OF_PAGE_DETAIL
*&---------------------------------------------------------------------*

FORM top_of_page_detail.

  REFRESH lt_list.

  DATA: lv_kullanici(50) TYPE c,
        lv_program(50)   TYPE c,
        lv_saat(50)      TYPE c,
        lv_lines(50)     TYPE c.

  CLEAR ls_list.
  ls_list-typ = 'H'.
  ls_list-info = 'Fatura Ve Fatura Detay Tablolarının Birleşmiş Hali'.
  APPEND ls_list TO lt_list.

  lv_kullanici = sy-uname.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Kullanici : '.
  ls_list-info = lv_kullanici .
  APPEND ls_list TO lt_list.

  lv_program = sy-repid.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Program Adı : '.
  ls_list-info = lv_program .
  APPEND ls_list TO lt_list.

  lv_saat = sy-uzeit.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Sistem Saati : '.
  CONCATENATE lv_saat+0(2) ':' lv_saat+2(2) ':' lv_saat+4(2) INTO lv_saat.
  ls_list-info = lv_saat.
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  DESCRIBE TABLE lt_fatura_detay_s LINES lv_lines.
  ls_list-typ = 'S'.
  ls_list-key = 'Toplam Kayıt Sayısı : '.
  ls_list-info = lv_lines.
  APPEND ls_list TO lt_list.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_list.
ENDFORM.

*&---------------------------------------------------------------------*
*& Include          ZTYU_TOP_OF_PAGE_EXCEL
*&---------------------------------------------------------------------*

FORM top_of_page_excel.

  REFRESH lt_list.

  DATA: lv_kullanici(50) TYPE c,
        lv_program(50)   TYPE c,
        lv_saat(50)      TYPE c,
        lv_lines(50)     TYPE c.

  CLEAR ls_list.
  ls_list-typ = 'H'.
  ls_list-info = 'Excel Verisindeki Header Ve Item Tablolarına Ait Veri'.
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Excel Dosyası :'.
  SPLIT p_fname AT '\' INTO TABLE t_value.
  DESCRIBE TABLE t_value LINES v_lines.
  v_cnt# = v_lines - 1.
  IF v_cnt# EQ 1 .
    ls_list-info = t_value[ 2 ].
  ELSEIF v_cnt# EQ 2 .
    ls_list-info = t_value[ 3 ].
  ELSEIF v_cnt# EQ 3 .
    ls_list-info = t_value[ 4 ].
  ELSEIF v_cnt# EQ 4 .
    ls_list-info = t_value[ 5 ].
  ELSEIF v_cnt# EQ 5 .
    ls_list-info = t_value[ 6 ].
  ELSEIF v_cnt# EQ 6 .
    ls_list-info = t_value[ 7 ].
  ELSEIF v_cnt# EQ 7 .
    ls_list-info = t_value[ 8 ].
  ELSEIF v_cnt# EQ 8 .
    ls_list-info = t_value[ 9 ].
  ELSEIF v_cnt# EQ 9 .
    ls_list-info = t_value[ 10 ].
  ELSEIF v_cnt# EQ 10 .
    ls_list-info = t_value[ 11 ].
  ENDIF.
  APPEND ls_list TO lt_list.

  lv_kullanici = sy-uname.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Kullanici : '.
  ls_list-info = lv_kullanici .
  APPEND ls_list TO lt_list.

  lv_program = sy-repid.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Program Adı : '.
  ls_list-info = lv_program .
  APPEND ls_list TO lt_list.

  lv_saat = sy-uzeit.
  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Sistem Saati : '.
  CONCATENATE lv_saat+0(2) ':' lv_saat+2(2) ':' lv_saat+4(2) INTO lv_saat.
  ls_list-info = lv_saat.
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  DESCRIBE TABLE gt_faturat_excel_s LINES lv_lines.
  ls_list-typ = 'S'.
  ls_list-key = 'Toplam Kayıt Sayısı : '.
  ls_list-info = lv_lines.
  APPEND ls_list TO lt_list.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_list.
ENDFORM.
