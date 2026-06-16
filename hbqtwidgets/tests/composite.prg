/*
 * $Id$
 */

/*
 * Copyright 2014 Pritpal Bedi <bedipritpal@hotmail.com>
 * www - http://harbour-project.org
 */


#include "hbtoqt.ch"
#include "hbqtstd.ch"
#include "hbqtgui.ch"
#include "inkey.ch"
#include "hbtrace.ch"

#pragma -w0

PROCEDURE Main()
   LOCAL oAct, oDA, oWnd, lExit := .F.

   hbqt_errorsys()
 hb_tracestate(1)
hb_tracefile("c:\cvs\log.log" )
hb_tracelevel(5 )
hb_traceflush(1)

   oWnd:= QMainWindow()
   oWnd:setAttribute( Qt_WA_DeleteOnClose, .F. )
   oWnd:show()

   oWnd:setMouseTracking( .t. )
   oWnd:SetFixedSize( 640, 435 )

   oDA := QWidget( oWnd )
   oWnd:setCentralWidget( oDA )

   oAct := Build_MenuBar( oWnd,@lExit )

   oWnd:connect( QEvent_KeyPress, {|e| My_Events( e, @lExit ) } )
   oWnd:connect( QEvent_Close   , {|| lExit := .T. } )
   oWnd:Show()

   USE testwgt.dbf NEW

//   oELoop := QEventLoop( oWnd )
//   DO WHILE .t.
//      oELoop:processEvents()
//      IF lExit
//         EXIT
//      ENDIF
//      oWnd:setWindowTitle( "Number of Qt Objects: " + hb_ntos( __hbqt_itemsInGlobalList() ) )
//   ENDDO
//   oELoop:exit( 0 )

   oWnd:activateWindow()
   QApplication():exec()
   dbCloseAll()

HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )
HB_TRACE( HB_TR_DEBUG, "SHUTTING DOWN" )

   HB_SYMBOL_UNUSED( oAct )
   RETURN


FUNCTION My_Events( e, lExit )
   IF e:key() == Qt_Key_Escape
      lExit := .T.
   ENDIF
   RETURN NIL


STATIC FUNCTION Build_MenuBar( oWnd )
   LOCAL oMenuBar, oMenu, oAct

   oMenuBar := oWnd:menuBar()
   oMenu := QMenu( oMenuBar )
   oMenu:setTitle( "Customer Info" )

   oAct := oMenu:addAction( "Customer Info")
   oAct:connect( "triggered(bool)", { || CustInfo(oWnd) } )

   oMenuBar:addMenu( oMenu )

   RETURN oAct


STATIC FUNCTION CustInfo(oWnd)
   LOCAL oBrowse, oDlg, kEsc, kIns

   LOCAL GetList := {}, SayList := {}
   LOCAL cCust := Space( 8 )
   LOCAL cCustName := Space( 30 )
   LOCAL cAddress1 := Space( 39 )
   LOCAL cAddress2 := Space( 39 )
   LOCAL cAddress3 := Space( 39 )

HB_TRACE( HB_TR_DEBUG, "1111" )
   oDlg := hbqtui_composite(oWnd)
HB_TRACE( HB_TR_DEBUG, "2222" )

//   oDlg:labelTitle:setStyleSheet( "background-color: qlineargradient(spread:pad, x1:0, y1:0.574, x2:1, y2:0, stop:0 rgba(37, 58, 122, 255), stop:1 rgba(255, 255, 255, 255));" )
//   oDlg:labelStatus:setStyleSheet( "background-color: rgb(215, 253, 255);" )

   oDlg:listItems:addItem( "First" )
   oDlg:listItems:addItem( "Second" )
   oDlg:listItems:addItem( "Third" )
   oDlg:listItems:addItem( "Fourth" )
   oDlg:listItems:addItem( "Fifth" )

   oDlg:btnOpt1:connect( "clicked()", {|| oDlg:labelStatus:setText( "Option 1 Clicked" ) } )
   oDlg:btnOpt2:connect( "clicked()", {|| oDlg:labelStatus:setText( "Option 2 Clicked" ) } )
   oDlg:btnOpt3:connect( "clicked()", {|| oDlg:labelStatus:setText( "Option 3 Clicked" ) } )
   oDlg:btnOpt4:connect( "clicked()", {|| oDlg:labelStatus:setText( "Option 4 Clicked" ) } )

//   @ 1,  1 QSAY "Customer No" QGET cCust PICTURE "@! "
//   @ 1, 22 QGET cCustName PICTURE "@! "
//   @ 2,  1 QSAY "Address L#1" QGET cAddress1
//   @ 3,  1 QSAY "Address L#2" QGET cAddress2
//   @ 4,  1 QSAY "Address L#3" QGET cAddress3

HB_TRACE( HB_TR_DEBUG, "A003" )

//   READ oDlg:groupGets LASTGETBLOCK {|| oDlg:labelStatus:setText( "Last Get Encountered, What to Do ?" ) } NOFOCUSFRAME NORESIZE

HB_TRACE( HB_TR_DEBUG, "A004" )
//    oBrowse := BuildBrowse( oDlg )

HB_TRACE( HB_TR_DEBUG, "A005" )
//   oDlg:connect( QEvent_Close   , {|| HbQtClearGets( oDlg:groupGets ), oBrowse:destroy() } )
//   oDlg:connect( QEvent_KeyPress, {|e| iif( e:key() == Qt_Key_Escape, Eval( {|| HbQtClearGets( oDlg:groupGets ), oBrowse:destroy() } ), NIL ) } )

//   oDlg:connect( QEvent_Close   , {|| HbQtClearGets( oDlg:groupGets )} )
//   oDlg:connect( QEvent_KeyPress, {|e| iif( e:key() == Qt_Key_Escape, Eval( {|| HbQtClearGets( oDlg:groupGets ) } ), NIL ) } )

HB_TRACE( HB_TR_DEBUG, "A006" )
   kEsc := SetKey( K_ESC, {|| oDlg:close() } )
//   kIns := SetKey( K_INS, {|| ReadInsert( ! ReadInsert() ) } )
HB_TRACE( HB_TR_DEBUG, "A007" )
//   ReadInsert( .T. )

HB_TRACE( HB_TR_DEBUG, "A008" )
    oDlg:setWindowTitle( "Number of Qt Objects: " + hb_ntos( __hbqt_itemsInGlobalList() ) )
HB_TRACE( HB_TR_DEBUG, "A009" )
   oDlg:exec()
HB_TRACE( HB_TR_DEBUG, "A010a" )
   // oDlg:destroy()
HB_TRACE( HB_TR_DEBUG, "A010b" )
   __hbqt_zap( oDlg )

HB_TRACE( HB_TR_DEBUG, "A011" )

   SetKey( K_ESC, kEsc )
   SetKey( K_INS, kIns )

HB_TRACE( HB_TR_DEBUG, "A012" )
   oDlg := NIL

HB_TRACE( HB_TR_DEBUG, "A013" )
   RETURN NIL

#define MYBROWSE
#ifdef MYBROWSE
STATIC FUNCTION BuildBrowse( oDlg )
   LOCAL oBrowse, i
   LOCAL aFields := { "LAST", "FIRST", "SALARY", "HIREDATE", "AGE", "CITY", "STATE", "ZIP", "NOTES" }
   LOCAL aTitles := { "Last Name", "First Name", "Salary", "Hire Date", "Age", "City", "State", "Zip", "Notes" }

HB_TRACE( HB_TR_DEBUG, "b010" )
   oBrowse := HbQtBrowseNew( 0, 0, 0, 0, oDlg:frameBrowse, QFont( "Courier new", 10 ) )

HB_TRACE( HB_TR_DEBUG, "b011" )
   oBrowse:goTopBlock          := {| | DbGoTop()        }
   oBrowse:goBottomBlock       := {| | DbGoBottom()     }

   oBrowse:firstPosBlock       := {| | 1                }
   oBrowse:lastPosBlock        := {| | LastRec()        }
   IF indexOrd() = 0
      oBrowse:posBlock         := {| | RecNo()          }
      oBrowse:goPosBlock       := {|n| DbGoto( n )      }
      oBrowse:phyPosBlock      := {| | RecNo()          }
   ELSE
      oBrowse:posBlock         := {| | OrdKeyNo()       }
      oBrowse:goPosBlock       := {|n| OrdKeyGoto( n )  }
      oBrowse:phyPosBlock      := {| | OrdKeyNo()       }
   ENDIF

HB_TRACE( HB_TR_DEBUG, "b012" )
   FOR i := 1 to len( aFields )

HB_TRACE( HB_TR_DEBUG, "b012:"+str(i,3) )
      oBrowse:addColumn( HbQtColumnNew( aTitles[ i ], FieldWBlock( aFields[ i ], select() ) ) )
   NEXT

HB_TRACE( HB_TR_DEBUG, "b013" )
   oBrowse:horizontalScrollbar := .T.
   oBrowse:verticalScrollbar   := .T.
   oBrowse:toolbar             := .t.
   oBrowse:toolbarLeft         := .T.
   oBrowse:statusbar           := .F.
   oBrowse:skipBlock           := {|n| Skipper( n ) }
   oBrowse:navigationBlock     := {|nKey,xData,oBrw|  HandleMe( nKey, xData, oBrw, oDlg ) }

HB_TRACE( HB_TR_DEBUG, "b014" )
   RETURN oBrowse


STATIC FUNCTION HandleMe( nKey, xData, oBrw, oDlg )
   HB_SYMBOL_UNUSED( xData  )
   HB_SYMBOL_UNUSED( oBrw )
   IF nKey == K_ESC
      oDlg:close()
      RETURN .T.
   ENDIF
   RETURN .F.


STATIC FUNCTION Skipper( nSkip )
   LOCAL i := 0

HB_TRACE( HB_TR_DEBUG, "SKIPPER IN" )
   DO CASE
   CASE ( nSkip = 0 .OR. LastRec() == 0 )
      dbSkip( 0 )
   CASE ( nSkip > 0 .AND. !eof() )
      DO WHILE ( i < nSkip )
         dbSkip( 1 )
         IF EOF()
            dbskip( -1 )
            EXIT
         ENDIF
         i++
      ENDDO
   CASE ( nSkip < 0 )
      DO WHILE ( i > nSkip )
         dbSkip( -1 )
         IF Bof()
            EXIT
         ENDIF
         i--
      ENDDO
   ENDCASE

HB_TRACE( HB_TR_DEBUG, "SKIPPER OUT" )
   RETURN i
#endif
