*&---------------------------------------------------------------------*
*& Include          ZTYU_ZSLCT_SCR_OUT
*&---------------------------------------------------------------------*

AT SELECTION-SCREEN OUTPUT.

IF P_RB1 = 'X'.
  LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'B1'.
       SCREEN-ACTIVE = 0.
       MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

  ELSEIF P_RB2 = 'X'.
   LOOP AT SCREEN.
    IF SCREEN-GROUP1 = 'A1'.
       SCREEN-ACTIVE = 0.
       MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
  ENDIF.
