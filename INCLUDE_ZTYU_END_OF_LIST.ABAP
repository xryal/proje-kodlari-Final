*&---------------------------------------------------------------------*
*& Include          ZTYU_END_OF_LIST
*&---------------------------------------------------------------------*
FORM end_of_list_excel_changes.


  REFRESH lt_list.


  CLEAR ls_list.
  ls_list-typ = 'H'.
  ls_list-info = 'Eklenen Ve Değişen Satır Sayıcı Paneli'.
  APPEND ls_list TO lt_list.


  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Header Eklenen Satır :'.
  ls_list-info = gs_sayici-gv_append_sayici_h .
  APPEND ls_list TO lt_list.

   CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Header Değişen Satır :'.
  ls_list-info = gs_sayici-gv_modify_sayici_h .
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Item Eklenen Satır : '.
  ls_list-info = gs_sayici-gv_append_sayici_i.
  APPEND ls_list TO lt_list.

  CLEAR ls_list.
  ls_list-typ = 'S'.
  ls_list-key = 'Item Değişen Satır :'.
  ls_list-info = gs_sayici-gv_modify_sayici_i .
  APPEND ls_list TO lt_list.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING
      it_list_commentary = lt_list.

ENDFORM.
