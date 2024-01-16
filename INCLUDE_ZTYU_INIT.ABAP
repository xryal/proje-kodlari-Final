*&---------------------------------------------------------------------*
*& Include          ZTYU_INIT
*&---------------------------------------------------------------------*

INITIALIZATION.

  "TAB AYARLAMALARI
  tb1-activetab = '1001'.
  tb1-dynnr  = 1001.
  tb1-prog   = sy-repid.

  "TAB BAŞLIKLARI
  t1 = 'Header Ve Item Tablosundan Veri Çek'.
  t2 = 'Excel Dosyası Oku'.

  "PROGRAMDAKİ BUTONLARIN İSİMLENDİRMELERİ
  pushbut1 =  'Excel Verisini Tabloda Göster'.
  pushbut3 = 'Oku Ve Alv''de Göster'.


  "FRAME İSİMLENDİRMELERİ
  frame1 = 'Okunacak Excel Dosyasını Seç'.
  frame2 = 'Excel Verisini Tabloya Aktarma'.
  frame4 = 'Header Ve Item Tablosundan Veri Oku'.

  " SELECTION SCREEN EKRANINDAKİ SİMGELİ EXCEL ŞABLONU BUTONU.
  sscrfields-functxt_01 = '@J2@ Örnek Excel Şablonu'.

  "ALV Layout'u Zebra
  gs_layout-zebra = abap_true.

  "ALV END OF LIST
  gs_event-name = slis_ev_end_of_list.
  gs_event-form = 'END_OF_LIST_EXCEL_CHANGES'.
  APPEND gs_event TO gt_events.
