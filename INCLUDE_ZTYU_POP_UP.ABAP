*&---------------------------------------------------------------------*
*& Include          ZTYU_POP_UP
*&---------------------------------------------------------------------*
FORM popup_to_confirm.
  CALL FUNCTION 'POPUP_WITH_2_BUTTONS_TO_CHOOSE'
    EXPORTING
      diagnosetext1 = 'Veri Değişimini Onaylıyor Musunuz ?'
      textline1     = 'Lütfen Excel Verilerinin Tutarlı Olup olmadığını Kontrol Ediniz, Yanlış Veri Girişinden Sizin Sorumlu Olduğunuzu Unutmayınız!'
      text_option1  = 'Evet'
      text_option2  = 'Hayır'
      titel         = 'Veri Değişimi'
    IMPORTING
      answer        = popup_return.
ENDFORM.
