*&---------------------------------------------------------------------*
*&         DDIC_HEADER_TO_ALV
*&---------------------------------------------------------------------*

FORM ddic_header_to_alv.

  REFRESH gt_faturat_head_s.
  REFRESH gt_faturat_head.
  REFRESH gt_fcat.

  SELECT * FROM zab_bill_thead INTO TABLE gt_faturat_head
    WHERE ab_fatura_id1 IN so_d1.

  LOOP AT gt_faturat_head INTO gs_faturat_head.

    MOVE-CORRESPONDING gs_faturat_head TO gs_faturat_head_s.
    APPEND gs_faturat_head_s TO gt_faturat_head_s.

    CLEAR gs_faturat_head.
    CLEAR gs_faturat_head_s.

  ENDLOOP.

  IF gt_faturat_head_s IS INITIAL.
    MESSAGE 'Aradığınız Kriterlere Uygun Veri Bulunamadı.' TYPE 'I'.
  ELSE.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZAB_BILL_THEAD'
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    LOOP AT gt_fcat INTO gs_fcat .

      gv_reptext = strlen( gs_fcat-reptext ).
      gs_fcat-outputlen = gv_reptext - 1.

      MODIFY gt_fcat FROM gs_fcat TRANSPORTING outputlen.

    ENDLOOP.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program       = sy-repid
        i_callback_pf_status_set = 'PF_STATUS_SET'
        i_callback_user_command  = 'USER_COMMAND'
        i_callback_top_of_page   = 'TOP_OF_PAGE'
        is_layout_lvc            = gs_layout
        it_fieldcat_lvc          = gt_fcat
        i_default                = 'X'
        i_save                   = ' '
      TABLES
        t_outtab                 = gt_faturat_head_s.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*&     DDIC_ITEM_DETAIL_TO_ALV
*&---------------------------------------------------------------------*

FORM ddic_item_detail_to_alv.

  REFRESH lt_fatura_detay_s.
  REFRESH lt_fatura_detay.
  REFRESH gt_fcat.

  SELECT * FROM zab_bill_titem
    right join zab_bill_thead
    ON zab_bill_thead~ab_fatura_id1 EQ zab_bill_titem~ab_fatura_id1
    INTO CORRESPONDING FIELDS OF TABLE @lt_fatura_detay
    WHERE zab_bill_thead~ab_fatura_id1 IN @so_d4
    AND  zab_bill_titem~ab_faturalanan_urun1 EQ @p_d6.

  LOOP AT lt_fatura_detay INTO ls_fatura_detay.

    MOVE-CORRESPONDING ls_fatura_detay TO ls_fatura_detay_s.
    APPEND ls_fatura_detay_s TO lt_fatura_detay_s.

    CLEAR ls_fatura_detay.
    CLEAR ls_fatura_detay_s.

  ENDLOOP.

  IF lt_fatura_detay_s IS INITIAL.
    MESSAGE 'Aradığınız Kriterlere Uygun Veri Bulunamadı.' TYPE 'I'.
  ELSE.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZAB_BILL_JOIN_S'
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    LOOP AT gt_fcat INTO gs_fcat .

      gv_reptext = strlen( gs_fcat-reptext ).
      gs_fcat-outputlen = gv_reptext - 1.

      MODIFY gt_fcat FROM gs_fcat TRANSPORTING outputlen.

    ENDLOOP.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program       = sy-repid
        i_callback_pf_status_set = 'PF_STATUS_SET'
        i_callback_user_command  = 'USER_COMMAND'
        i_callback_top_of_page   = 'TOP_OF_PAGE_DETAIL'
        is_layout_lvc            = gs_layout
        it_fieldcat_lvc          = gt_fcat
        i_default                = 'X'
        i_save                   = ' '
      TABLES
        t_outtab                 = lt_fatura_detay_s.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*&    ZTYU_DDIC_ITEM_TO_ALV
*&---------------------------------------------------------------------*

FORM ddic_item_to_alv.

  REFRESH lt_fatura_detay_s.
  REFRESH lt_fatura_detay.
  REFRESH gt_fcat.

SELECT * FROM zab_bill_titem
    right join zab_bill_thead
    ON zab_bill_thead~ab_fatura_id1 EQ zab_bill_titem~ab_fatura_id1
    INTO CORRESPONDING FIELDS OF TABLE @lt_fatura_detay
    WHERE zab_bill_thead~ab_fatura_id1 IN @so_d4 .

  LOOP AT lt_fatura_detay INTO ls_fatura_detay.

    MOVE-CORRESPONDING ls_fatura_detay TO ls_fatura_detay_s.
    APPEND ls_fatura_detay_s TO lt_fatura_detay_s.

    CLEAR ls_fatura_detay_s.
    CLEAR ls_fatura_detay.

  ENDLOOP.

  IF lt_fatura_detay_s IS INITIAL.
    MESSAGE 'Aradığınız Kriterlere Uygun Veri Bulunamadı.' TYPE 'I'.
  ELSE.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZAB_BILL_JOIN_S'
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    LOOP AT gt_fcat INTO gs_fcat .

      gv_reptext = strlen( gs_fcat-reptext ).
      gs_fcat-outputlen = gv_reptext - 1.

      MODIFY gt_fcat FROM gs_fcat TRANSPORTING outputlen.

    ENDLOOP.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program       = sy-repid
        i_callback_pf_status_set = 'PF_STATUS_SET'
        i_callback_user_command  = 'USER_COMMAND'
        i_callback_top_of_page   = 'TOP_OF_PAGE_DETAIL'
        is_layout_lvc            = gs_layout
        it_fieldcat_lvc          = gt_fcat
        i_default                = 'X'
        i_save                   = ' '
      TABLES
        t_outtab                 = lt_fatura_detay_s.
  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*&  ZTYU_DDIC_MERGED_TO_ALV
*&---------------------------------------------------------------------*

FORM ddic_merged_to_alv.

  REFRESH lt_fatura_detay.
  REFRESH lt_fatura_detay_s.
  REFRESH gt_fcat.

  SELECT * FROM zab_bill_titem
    RIGHT OUTER JOIN zab_bill_thead
    ON zab_bill_thead~ab_fatura_id1 EQ zab_bill_titem~ab_fatura_id1
    INTO CORRESPONDING FIELDS OF TABLE @lt_fatura_detay.


  LOOP AT lt_fatura_detay INTO ls_fatura_detay.

    MOVE-CORRESPONDING ls_fatura_detay TO ls_fatura_detay_s.
    APPEND ls_fatura_detay_s TO lt_fatura_detay_s.

    CLEAR ls_fatura_detay.
    CLEAR ls_fatura_detay_s.

  ENDLOOP.

  IF lt_fatura_detay_s IS INITIAL.
    MESSAGE 'Aradığınız Kriterlere Uygun Veri Bulunamadı.' TYPE 'I'.
  ELSE.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name       = 'ZAB_BILL_JOIN_S'
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    LOOP AT gt_fcat INTO gs_fcat .

      gv_reptext = strlen( gs_fcat-reptext ).
      gs_fcat-outputlen = gv_reptext - 1.

      MODIFY gt_fcat FROM gs_fcat TRANSPORTING outputlen.

    ENDLOOP.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY_LVC'
      EXPORTING
        i_callback_program       = sy-repid
        i_callback_pf_status_set = 'PF_STATUS_SET'
        i_callback_user_command  = 'USER_COMMAND'
        i_callback_top_of_page   = 'TOP_OF_PAGE_DETAIL'
        is_layout_lvc            = gs_layout
        it_fieldcat_lvc          = gt_fcat
        i_default                = 'X'
        i_save                   = ' '
      TABLES
        t_outtab                 = lt_fatura_detay_s.
  ENDIF.
ENDFORM.
