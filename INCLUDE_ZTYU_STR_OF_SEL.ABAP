*&---------------------------------------------------------------------*
*& Include          ZTYU_STR_OF_SEL
*&---------------------------------------------------------------------*

START-OF-SELECTION.

  CASE tb1-dynnr.
    WHEN 1001.
      IF so_d1 IS INITIAL AND so_d4 IS INITIAL AND p_d6 IS INITIAL.
        MESSAGE 'Key Alan Seçimi Yapmadınız Fatura Tablosunda İlgili Faturalar Ve Faturalara Bağlı Tüm  Ürünlerin Bilgileri Getiriliyor.' TYPE 'I'.
        PERFORM ddic_merged_to_alv.

      ELSEIF so_d1 IS INITIAL AND so_d4 IS INITIAL AND p_d6 IS NOT INITIAL .
        MESSAGE 'Lütfen Fatura Detay Tablosuna Ait Fatura ID Girişi Yapınız.' TYPE 'I'.

      ELSEIF so_d1 IS INITIAL AND so_d4 IS NOT INITIAL AND p_d6 IS INITIAL .
        MESSAGE 'Fatura Detay Tablosunda İlgili Faturaların Id''sine Ait Tüm Ürünlerin Bilgileri Getiriliyor.' TYPE 'I'.
        PERFORM ddic_item_to_alv.

      ELSEIF so_d1 IS INITIAL AND so_d4 IS NOT INITIAL AND p_d6 IS NOT INITIAL .
        MESSAGE 'Fatura Detay Tablosunda İlgili Faturaların Id''sine Ait  Malzeme No bilgisine Göre Detay Bilgileri Getiriliyor.' TYPE 'I'.
        PERFORM ddic_item_detail_to_alv.

      ELSEIF so_d1 IS NOT INITIAL AND so_d4 IS INITIAL AND p_d6 IS INITIAL.
        MESSAGE 'Fatura Genel Bilgiler Tablosuna Ait  Fatura ID''ye Göre İlgili Faturalar Getiriliyor.' TYPE 'I'.
        PERFORM ddic_header_to_alv.

      ELSEIF so_d1 IS NOT INITIAL AND so_d4 IS INITIAL AND p_d6 IS NOT INITIAL .
        MESSAGE 'Hem Fatura Genel Bilgiler Tablosundan Hem de Fatura Detay Tablosundan Key Alan Seçimi Yapamazsınız. Lütfen Tek Tablo Özelinde Seçim Yapınız.' TYPE 'I'.

      ELSEIF so_d1 IS NOT INITIAL AND so_d4 IS NOT INITIAL AND p_d6 IS INITIAL .
        MESSAGE 'Hem Fatura Genel Bilgiler Tablosundan Hem de Fatura Detay Tablosundan Key Alan Seçimi Yapamazsınız. Lütfen Tek Tablo Özelinde Seçim Yapınız.' TYPE 'I'.

      ELSEIF so_d1 IS NOT INITIAL AND so_d4 IS NOT INITIAL AND p_d6 IS NOT INITIAL .
        MESSAGE 'Hem Fatura Genel Bilgiler Tablosundan Hem de Fatura Detay Tablosundan Key Alan Seçimi Yapamazsınız. Lütfen Tek Tablo Özelinde Seçim Yapınız.' TYPE 'I'.
      ENDIF.

    WHEN 1002.
      FIND '.xlsx' IN p_fname.
      IF p_fname IS INITIAL.
        MESSAGE 'Dosya Seçimi Yapmadınız.' TYPE 'I' DISPLAY LIKE 'A'.
      ELSEIF sy-subrc NE 0.
        MESSAGE 'Dosya Formatı Yanlış.' TYPE 'I' DISPLAY LIKE 'A'.
      ELSE.
        PERFORM upload_data_excel.
        IF gt_faturat_excel_s IS INITIAL.
          MESSAGE 'Dosya içeriği Boş Olduğu İçin Lütfen Dolu Item Dosyası Seçiniz' TYPE 'I' DISPLAY LIKE 'A'.
        ELSE.
          PERFORM alv_generator_excel.
        ENDIF.
      ENDIF.

  ENDCASE.
