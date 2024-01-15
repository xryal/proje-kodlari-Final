*&---------------------------------------------------------------------*
*& Include          ZTYU_FILE_TEMPLATE
*&---------------------------------------------------------------------*

FORM create_excel_format.

  DATA: excel    TYPE ole2_object,
        workbook TYPE ole2_object,
        sheet    TYPE ole2_object,
        cell     TYPE ole2_object,
        row      TYPE ole2_object.

  CREATE OBJECT excel 'EXCEL.APPLICATION'.

* Excel Dosyası
  CALL METHOD OF excel 'WORKBOOKS' = workbook.

  SET PROPERTY OF excel 'VISIBLE' = 0 .

  SET PROPERTY OF excel 'VISIBLE' = 1 .

  CALL METHOD OF workbook 'add'.

  CALL METHOD OF excel 'Worksheets' = sheet EXPORTING #1 = 1.

  CALL METHOD OF sheet 'Activate'.

  " Excel Başlık Satırı
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'A1'.
  SET PROPERTY OF cell 'VALUE' = 'Fatura ID'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'B1'.
  SET PROPERTY OF cell 'VALUE' = 'Fatura Türü'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'C1'.
  SET PROPERTY OF cell 'VALUE' = 'Şirket Kod'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'D1'.
  SET PROPERTY OF cell 'VALUE' = 'Şirket Adı'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'E1'.
  SET PROPERTY OF cell 'VALUE' = 'Vergi Bilgisi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'F1'.
  SET PROPERTY OF cell 'VALUE' = 'Adres Bilgisi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'G1'.
  SET PROPERTY OF cell 'VALUE' = 'Satis Org'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'H1'.
  SET PROPERTY OF cell 'VALUE' = 'Dağıtım Kanalı'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'I1'.
  SET PROPERTY OF cell 'VALUE' = 'Dağıtım Yeri'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'J1'.
  SET PROPERTY OF cell 'VALUE' = 'Ödeme Koşulları'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'K1'.
  SET PROPERTY OF cell 'VALUE' = 'Faturalanma Tarihi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'L1'.
  SET PROPERTY OF cell 'VALUE' = 'Teslimat Tarihi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'M1'.
  SET PROPERTY OF cell 'VALUE' = 'Ürün Numarası'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'N1'.
  SET PROPERTY OF cell 'VALUE' = 'Ürün Adı'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'O1'.
  SET PROPERTY OF cell 'VALUE' = 'Ürün Miktarı'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'P1'.
  SET PROPERTY OF cell 'VALUE' = 'Ölçü Birimi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'Q1'.
  SET PROPERTY OF cell 'VALUE' = 'Net Fiyat'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'R1'.
  SET PROPERTY OF cell 'VALUE' = 'Vergi Toplam'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'S1'.
  SET PROPERTY OF cell 'VALUE' = 'İndirim Miktarı'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'T1'.
  SET PROPERTY OF cell 'VALUE' = 'Satis Para Birimi'.
  CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'U1'.
  SET PROPERTY OF cell 'VALUE' = 'Ürün Açıklaması'.

  " Excel Örnek veri.
  ls_excel_format-ab_fatura_id1 = '1'.
  ls_excel_format-ab_fatura_turu = 'KTG'.
  ls_excel_format-ab_sirket_kodu  = 'WIOK'.
  ls_excel_format-ab_sirket_adi  = 'Erciyes Anadolu Holding'.
  ls_excel_format-ab_vergi_bilgisi  = 'Kdv'.
  ls_excel_format-ab_adres_bilgisi  = 'Ambar'.
  ls_excel_format-ab_satis_org  = 'M9H7'.
  ls_excel_format-ab_dagitim_kanali  = 'ID'.
  ls_excel_format-ab_dagitim_yeri  = 'FR'.
  ls_excel_format-ab_odeme_kosullari  = 'visa'.
  ls_excel_format-ab_faturalama_tarihi  = '20241017'.
  ls_excel_format-ab_teslimat_tarihi  = '20240430'.
  ls_excel_format-ab_faturalanan_urun1  = '94WZ'.
  ls_excel_format-ab_urun_adi1  = 'Satılan urun'.
  ls_excel_format-ab_urun_sayisi  = '191'.
  ls_excel_format-ab_urun_satis_birimi  = 'CEV'.
  ls_excel_format-ab_net_fiyat1  = '1,467.00'.
  ls_excel_format-ab_vergi_toplami  = '467.00'.
  ls_excel_format-ab_indirim_miktari  = '28.00'.
  ls_excel_format-ab_satis_para_birimi  = 'TRY'.
  ls_excel_format-ab_urun_aciklamasi  = 'Satılan urun açıklaması'.


  APPEND ls_excel_format TO lt_excel_format.

  " Excel Örnek Verilerini İnternal Tabloya ekledim
  LOOP AT lt_excel_format.
    CALL METHOD OF excel 'ROWS' = row EXPORTING #1 = '2'.
    CALL METHOD OF row 'INSERT' NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'A2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_fatura_id1 NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'B2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_fatura_turu NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'C2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_sirket_kodu NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'D2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_sirket_adi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'E2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_vergi_bilgisi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'F2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_adres_bilgisi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'G2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_satis_org NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'H2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_dagitim_kanali NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'I2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_dagitim_yeri NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'J2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_odeme_kosullari NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'K2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_faturalama_tarihi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'L2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_teslimat_tarihi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'M2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_faturalanan_urun1 NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'N2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_urun_adi1 NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'O2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_urun_sayisi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'Q2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_urun_satis_birimi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'R2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_net_fiyat1 NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'S2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_vergi_toplami NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'T2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_indirim_miktari NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'T2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_satis_para_birimi NO FLUSH.
    CALL METHOD OF excel 'RANGE' = cell EXPORTING #1 = 'U2'.
    SET PROPERTY OF cell 'VALUE' = lt_excel_format-ab_urun_aciklamasi NO FLUSH.

  ENDLOOP.

  CALL METHOD OF excel 'SAVE'.
  CALL METHOD OF excel 'QUIT'.

  FREE OBJECT cell.
  FREE OBJECT workbook.
  FREE OBJECT excel.

  excel-handle = -1.

  FREE OBJECT row.
ENDFORM.
