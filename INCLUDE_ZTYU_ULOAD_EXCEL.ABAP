*&---------------------------------------------------------------------*
*& Include          ZTYU_ULOAD_EXCEL
*&---------------------------------------------------------------------*

FORM upload_data_excel.

  TYPES: BEGIN OF ty_timestamp,
           yil(4) TYPE c,
           ay(2)  TYPE c,
           gun(2) TYPE c,
         END OF ty_timestamp.

  DATA : lv_timeraw(10) TYPE c,
         ls_timestamp   TYPE ty_timestamp.

  DATA: lt_file LIKE alsmex_tabline OCCURS 0 WITH HEADER LINE.
  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = p_fname
      i_begin_col             = 1
      i_begin_row             = 2
      i_end_col               = 21
      i_end_row               = 1000
    TABLES
      intern                  = lt_file
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.
  IF sy-subrc NE 0 OR lt_file[] IS  INITIAL.
    MESSAGE 'Dosya Okunamadı !' TYPE 'I'.
  ELSE.
    REFRESH gt_faturat_excel_s.
    LOOP AT lt_file.
      CASE lt_file-col.
        WHEN '0001'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_fatura_id1.
        WHEN '0002'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_fatura_turu.
        WHEN '0003'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_sirket_kodu.
        WHEN '0004'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_sirket_adi.
        WHEN '0005'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_vergi_bilgisi.
        WHEN '0006'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_adres_bilgisi.
        WHEN '0007'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_satis_org.
        WHEN '0008'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_dagitim_kanali.
        WHEN '0009'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_dagitim_yeri.
        WHEN '0010'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_odeme_kosullari.
        WHEN '0011'.
          MOVE lt_file-value TO lv_timeraw.
          SPLIT lv_timeraw AT '.' INTO ls_timestamp-gun ls_timestamp-ay ls_timestamp-yil .
          CONCATENATE ls_timestamp-yil ls_timestamp-ay ls_timestamp-gun INTO gs_faturat_excel_s-ab_faturalama_tarihi.
        WHEN '0012'.
          MOVE lt_file-value TO lv_timeraw.
          SPLIT lv_timeraw AT '.' INTO ls_timestamp-gun ls_timestamp-ay ls_timestamp-yil .
          CONCATENATE ls_timestamp-yil ls_timestamp-ay ls_timestamp-gun INTO gs_faturat_excel_s-ab_teslimat_tarihi.
        WHEN '0013'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_faturalanan_urun1.
        WHEN '0014'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_urun_adi1.
        WHEN '0015'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_urun_sayisi.
        WHEN '0016'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_urun_satis_birimi.
        WHEN '0017'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_net_fiyat1.
        WHEN '0018'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_vergi_toplami.
        WHEN '0019'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_indirim_miktari.
        WHEN '0020'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_satis_para_birimi.
        WHEN '0021'.
          MOVE lt_file-value TO gs_faturat_excel_s-ab_urun_aciklamasi.
      ENDCASE.

      AT END OF row.
        APPEND gs_faturat_excel_s TO gt_faturat_excel_s.
        CLEAR gs_faturat_excel_s.
      ENDAT.
    ENDLOOP.

  ENDIF.
ENDFORM.
