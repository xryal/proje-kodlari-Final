*&---------------------------------------------------------------------*
*& Include          ZTYU_ALV_EXCEL
*&---------------------------------------------------------------------*

FORM alv_generator_excel.

  REFRESH gt_fcat.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name       = 'ZAB_BILL_EXCEL'
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
      is_layout_lvc            = gs_layout
      it_fieldcat_lvc          = gt_fcat
      it_events                = gt_events
      i_callback_top_of_page   = 'TOP_OF_PAGE_EXCEL'
      i_default                = 'X'
      i_save                   = ' '
    TABLES
      t_outtab                 = gt_faturat_excel_s.
ENDFORM.
