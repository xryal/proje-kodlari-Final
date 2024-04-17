*&---------------------------------------------------------------------*
*& Include          ZTYU_PF_STATUS_SET
*&---------------------------------------------------------------------*

FORM pf_status_set USING p_extab TYPE slis_t_extab.
  SET PF-STATUS 'ZSTANDARD_FULLSCREEN'.
ENDFORM.

FORM user_command USING r_ucomm     LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.

  CASE r_ucomm.

    WHEN '&MAINHEAD'.
      CALL TRANSACTION 'ZAB_FATURA_HCODE'.


    WHEN '&MAINITEM'.
      CALL TRANSACTION 'ZAB_FATURA_ICODE'.

    WHEN '&INSRTEX'.

      IF  p_fname IS NOT INITIAL AND gt_faturat_excel_s IS INITIAL AND tb1-dynnr EQ 1002.
        MESSAGE 'Tablonun İçeriği Boş Lütfen Verilerinizi Kontrol Ediniz!' TYPE 'I' DISPLAY LIKE 'A'.

      ELSEIF  p_fname IS INITIAL AND gt_faturat_excel_s IS NOT INITIAL AND tb1-dynnr EQ 1002.
        MESSAGE 'Dosya Yolu Boş, Lütfen  Kontrol Ediniz!' TYPE 'I' DISPLAY LIKE 'A'.

      ELSEIF  p_fname IS INITIAL AND gt_faturat_excel_s IS  INITIAL AND tb1-dynnr EQ 1002.
        MESSAGE 'Dosya Yolu Boş, Lütfen  Kontrol Ediniz!' TYPE 'I' DISPLAY LIKE 'A'.

      ELSEIF  p_fname IS NOT INITIAL AND gt_faturat_excel_s IS NOT INITIAL AND tb1-dynnr EQ 1002 .

        PERFORM popup_to_confirm.
        IF popup_return EQ '1'.

          REFRESH gt_faturat_head_s.
          REFRESH gt_faturat_item_s.
          clear gs_sayici.

         
          SELECT * FROM zab_bill_thead INTO CORRESPONDING FIELDS OF TABLE gt_faturat_head_s.
          SELECT * FROM zab_bill_titem INTO CORRESPONDING FIELDS OF TABLE gt_faturat_item_s.

         
          LOOP AT gt_faturat_excel_s INTO gs_faturat_excel_s .

          
            MOVE-CORRESPONDING gs_faturat_excel_s TO gs_faturat_hexcel.
            MOVE-CORRESPONDING gs_faturat_excel_s TO gs_faturat_iexcel.

          
            READ TABLE gt_faturat_head_s INTO gs_faturat_head_s WITH KEY ab_fatura_id1 = gs_faturat_hexcel-ab_fatura_id1.

            
            IF sy-subrc NE 0.

            
              IF gs_faturat_hexcel-ab_fatura_id1 IS NOT INITIAL.

              
                APPEND gs_faturat_hexcel TO gt_faturat_head_s.
                gs_sayici-gv_append_sayici_h = gs_sayici-gv_append_sayici_h + 1.

               
                IF  gs_faturat_iexcel-ab_faturalanan_urun1 IS NOT INITIAL .

              
                  APPEND gs_faturat_iexcel TO gt_faturat_item_s.
                  gs_sayici-gv_append_sayici_i = gs_sayici-gv_append_sayici_i + 1.

                ENDIF.
              ENDIF.

          
              CLEAR gs_faturat_head_s.
              CLEAR gs_faturat_hexcel.
              CLEAR gs_faturat_iexcel.

             
              CONTINUE.

         
            ELSEIF  sy-subrc LT 1 AND gs_faturat_hexcel NE gs_faturat_head_s.

              MODIFY gt_faturat_head_s FROM gs_faturat_hexcel TRANSPORTING
              ab_vergi_bilgisi
              ab_teslimat_tarihi
              ab_sirket_kodu
              ab_sirket_adi
              ab_satis_org
              ab_odeme_kosullari
              ab_faturalama_tarihi
              ab_fatura_turu
              ab_dagitim_yeri
              ab_dagitim_kanali
              ab_adres_bilgisi
              WHERE ab_fatura_id1 = gs_faturat_head_s-ab_fatura_id1.

              gs_sayici-gv_modify_sayici_h = gs_sayici-gv_modify_sayici_h + 1.

              CLEAR gs_faturat_head_s.
              CLEAR gs_faturat_hexcel.

            ELSE.

              " satırlar tamamen aynı olduğu için değişim yapılmaz.

            ENDIF.

          
            READ TABLE gt_faturat_item_s INTO gs_faturat_item_s WITH KEY ab_fatura_id1 = gs_faturat_iexcel-ab_fatura_id1.

          
            IF sy-subrc NE 0.

           
              IF gs_faturat_iexcel-ab_fatura_id1 IS NOT INITIAL AND gs_faturat_iexcel-ab_faturalanan_urun1 IS NOT INITIAL.

               
                APPEND gs_faturat_iexcel TO gt_faturat_item_s.
                gs_sayici-gv_append_sayici_i = gs_sayici-gv_append_sayici_i + 1.

              ENDIF.

              CLEAR gs_faturat_item_s.
              CLEAR gs_faturat_iexcel.

          
              CONTINUE.

         
            ELSEIF sy-subrc LT 1 .

           
              READ TABLE gt_faturat_item_s INTO gs_faturat_item_s WITH KEY ab_faturalanan_urun1 = gs_faturat_iexcel-ab_faturalanan_urun1.


             
              IF sy-subrc NE 0.
               
                IF gs_faturat_iexcel-ab_faturalanan_urun1 IS NOT INITIAL.

                 
                  APPEND gs_faturat_iexcel TO gt_faturat_item_s.
                  gs_sayici-gv_append_sayici_i = gs_sayici-gv_append_sayici_i + 1.

                ENDIF.

                CLEAR gs_faturat_item_s.
                CLEAR gs_faturat_iexcel.

                CONTINUE.

              
              ELSEIF sy-subrc LT 1 AND gs_faturat_iexcel NE gs_faturat_item_s.

                MODIFY gt_faturat_item_s FROM gs_faturat_iexcel TRANSPORTING
                ab_vergi_toplami
                ab_urun_sayisi
                ab_urun_satis_birimi
                ab_urun_adi1
                ab_urun_aciklamasi
                ab_satis_para_birimi
                ab_net_fiyat1
                ab_indirim_miktari
                WHERE ab_fatura_id1 = gs_faturat_item_s-ab_fatura_id1
                AND ab_faturalanan_urun1 = gs_faturat_item_s-ab_faturalanan_urun1.

                gs_sayici-gv_modify_sayici_i = gs_sayici-gv_modify_sayici_i + 1.

                CLEAR gs_faturat_item_s.
                CLEAR gs_faturat_iexcel.

              ENDIF.

            ELSE.
              " satırlar tamamen aynı olduğu için işlem yapılmaz.

            ENDIF.
          ENDLOOP.

        
          REFRESH gt_faturat_head.
          REFRESH gt_faturat_item.

          
          MOVE-CORRESPONDING gt_faturat_head_s TO gt_faturat_head.
          MOVE-CORRESPONDING gt_faturat_item_s TO gt_faturat_item.

          "MODIFY ZTABLE FROM TABLE ITAB syntaxında casting olmadığı için.
          MODIFY zab_bill_thead FROM TABLE gt_faturat_head.

          IF sy-subrc LT 1.

            MODIFY zab_bill_titem FROM TABLE gt_faturat_item.

            IF sy-subrc LT 1 .

              MESSAGE 'Excel İçeriği Item ve Header Tablomuza Başarıyla Kaydedildi.' TYPE 'I'.

            ELSE.

              MESSAGE 'Excel İçeriği Item Tablosuna Kaydedilirken Sorun Yaşandı.' TYPE 'I'.

            ENDIF.

          ELSE.

            MESSAGE 'Excel İçeriği Header Tablosuna Kaydedilirken Sorun Yaşandı. Veri Tutarsızlığı Yaşanmaması İçin İtem Tablosuna Kayıt Gerçekleşmedi.' TYPE 'I'.

          ENDIF.

        ELSE.
          MESSAGE 'Veri İşleme  İşlemini Onaylamadınız.' TYPE 'I' DISPLAY LIKE 'A'.
        ENDIF.

      ELSE.
        MESSAGE 'Tab2 Aktif Değil İken Veri Yüklemeye İzin Verilmemektedir.' TYPE 'I' DISPLAY LIKE 'A'.
      ENDIF.

  ENDCASE.

ENDFORM.
