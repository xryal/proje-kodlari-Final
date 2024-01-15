*&---------------------------------------------------------------------*
*& Include          ZTYU_FPICKER
*&---------------------------------------------------------------------*

FORM f4_fname.
  DATA: file_table TYPE filetable,
        file_line TYPE file_table,
        rc TYPE i.

  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      default_extension       = ''
    CHANGING
      file_table              = file_table
      rc                      = rc
    EXCEPTIONS
      file_open_dialog_failed = 1
      cntl_error              = 2
      error_no_gui            = 3
      not_supported_by_gui    = 4
      OTHERS                  = 5.

  READ TABLE file_table INTO file_line INDEX 1.
  IF sy-subrc = 0.
    p_fname = file_line-filename.
  ENDIF.
ENDFORM.
