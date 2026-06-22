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

HB_TRACE( HB_TR_DEBUG, "A-001" )
   oWnd:= QMainWindow()
HB_TRACE( HB_TR_DEBUG, "A-002" )
   oWnd:setAttribute( Qt_WA_DeleteOnClose, .F. )
HB_TRACE( HB_TR_DEBUG, "A-003" )

   oWnd:setMouseTracking( .t. )
   oWnd:SetFixedSize( 640, 435 )

HB_TRACE( HB_TR_DEBUG, "A-004" )
   oWnd:show()
HB_TRACE( HB_TR_DEBUG, "A-005" )

   oDA := QWidget( oWnd )
HB_TRACE( HB_TR_DEBUG, "A-006" )
   oWnd:setCentralWidget( oDA )
HB_TRACE( HB_TR_DEBUG, "A-007" )

   oAct := Build_MenuBar( oWnd,@lExit )

HB_TRACE( HB_TR_DEBUG, "A-008" )
//   oWnd:connect( QEvent_KeyPress, {|e| My_Events( e, @lExit ) } )
//   oWnd:connect( QEvent_Close   , {|| lExit := .T. } )
HB_TRACE( HB_TR_DEBUG, "A-009" )
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

HB_TRACE( HB_TR_DEBUG, "A-010" )
   oWnd:activateWindow()
HB_TRACE( HB_TR_DEBUG, "A-011" )
   QApplication():exec()
HB_TRACE( HB_TR_DEBUG, "A-012" )
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
//   oDlg:setAttribute( Qt_WA_DeleteOnClose, .T. )
//   oDlg:labelTitle:setStyleSheet( "background-color: qlineargradient(spread:pad, x1:0, y1:0.574, x2:1, y2:0, stop:0 rgba(37, 58, 122, 255), stop:1 rgba(255, 255, 255, 255));" )
//   oDlg:labelStatus:setStyleSheet( "background-color: rgb(215, 253, 255);" )

   oDlg:listItems:addItem( "First" )
   oDlg:listItems:addItem( "Second" )
   oDlg:listItems:addItem( "Third" )
   oDlg:listItems:addItem( "Fourth" )
   oDlg:listItems:addItem( "Fifth" )

HB_TRACE( HB_TR_DEBUG, "button1 clicked()" )
   oDlg:btnOpt1:connect( "clicked()", {|| oDlg:labelTitle:setText( "Option 1 Clicked" ) } )
HB_TRACE( HB_TR_DEBUG, "button2 clicked()" )
   oDlg:btnOpt2:connect( "clicked()", {|| oDlg:labelTitle:setText( "Option 2 Clicked" ) } )
   oDlg:btnOpt3:connect( "clicked()", {|| oDlg:labelTitle:setText( "Option 3 Clicked" ) } )
   oDlg:btnOpt4:connect( "clicked()", {|| oDlg:labelTitle:setText( "Option 4 Clicked" ) } )

HB_TRACE( HB_TR_DEBUG, "A003" )


HB_TRACE( HB_TR_DEBUG, "A004" )

HB_TRACE( HB_TR_DEBUG, "A005" )

HB_TRACE( HB_TR_DEBUG, "A006" )
   // kEsc := SetKey( K_ESC, {|| oDlg:close() } )
HB_TRACE( HB_TR_DEBUG, "A007" )

HB_TRACE( HB_TR_DEBUG, "A008" )
//    oDlg:setWindowTitle( "Number of Qt Objects: " + hb_ntos( __hbqt_itemsInGlobalList() ) )
HB_TRACE( HB_TR_DEBUG, "A009" )
   oDlg:exec()
HB_TRACE( HB_TR_DEBUG, "A010a" )
   // oDlg:destroy()
HB_TRACE( HB_TR_DEBUG, "A010b" )
__hbqt_itemsInGlobalList()
   __hbqt_zap( oDlg )

HB_TRACE( HB_TR_DEBUG, "VALTYPE(oDlg) "+valtype( oDlg )+":"+oDlg:className() )
HB_TRACE( HB_TR_DEBUG, "A010b2" )
//   __hbqt_zap( oDlg )
HB_TRACE( HB_TR_DEBUG, "A010c" )
//   oDlg:setParent( QWidget() )

HB_TRACE( HB_TR_DEBUG, "A011" )

//   SetKey( K_ESC, kEsc )
//   SetKey( K_INS, kIns )

HB_TRACE( HB_TR_DEBUG, "A012" )
   oDlg := NIL

HB_TRACE( HB_TR_DEBUG, "A013" )
   RETURN NIL

#include "hbqtcore.ch"
#include "hbqtgui.ch"
#include "hbclass.ch"
#include "error.ch"
#include "hbtrace.ch"

#pragma -w0

FUNCTION hbqtui_composite( oParent )
   LOCAL o

   o := ui_composite():new( oParent )
   o:popolate()

   RETURN o


CLASS ui_composite INHERIT HB_QDialog

   VAR    labelTitle
   VAR    groupGets
   VAR    frameBrowse
   VAR    listItems
   VAR    btnOpt1
   VAR    btnOpt2
   VAR    btnOpt3
   VAR    btnOpt4
   VAR    labelStatus

   METHOD destroy()
   METHOD popolate()

   ENDCLASS


METHOD ui_composite:popolate(oParent)

   HB_TRACE( HB_TR_DEBUG, "ui_composite:popolate ENTER" )

   ::resize( 481, 519 )

   ::labelTitle                        := QLabel( Self )
   ::labelTitle                        :  setObjectName( e"labelTitle" )
   ::labelTitle                        :  setGeometry( 20, 10, 441, 20 ) 
   ::labelTitle                        :  setAlignment( Qt_AlignCenter )
   //::groupGets                         := QGroupBox( Self )
   //::groupGets                         :  setObjectName( e"groupGets" )
   //::groupGets                         :  setGeometry( 20, 40, 441, 151 )
   ::frameBrowse                       := QFrame( Self )
   ::frameBrowse                       :  setObjectName( e"frameBrowse" )
   ::frameBrowse                       :  setGeometry( 20, 200, 351, 271 )
   ::frameBrowse                       :  setFrameShape( QFrame_Box )
   ::frameBrowse                       :  setFrameShadow( QFrame_Plain )
   ::listItems                         := QListWidget( Self )
   ::listItems                         :  setObjectName( e"listItems" )
   ::listItems                         :  setGeometry(  380, 200, 81, 181 )
   ::btnOpt1                           := QPushButton( Self )
   ::btnOpt1                           :  setObjectName( e"btnOpt1" )
   ::btnOpt1                           :  setGeometry( 380, 390, 81, 23 )
   ::btnOpt2                           := QPushButton( Self )
   ::btnOpt2                           :  setObjectName( e"btnOpt2" )
   ::btnOpt2                           :  setGeometry( 380, 420, 81, 23 )
   ::btnOpt3                           := QPushButton( Self )
   ::btnOpt3                           :  setObjectName( e"btnOpt3" )
   ::btnOpt3                           :  setGeometry( 380, 450, 81, 23 )
   ::btnOpt4                           := QPushButton( Self )
   ::btnOpt4                           :  setObjectName( e"btnOpt4" )
   ::btnOpt4                           :  setGeometry( 380, 480, 81, 23 )
   ::labelStatus                       := QLabel( Self )
   ::labelStatus                       :  setObjectName( e"labelStatus" )
   ::labelStatus                       :  setGeometry( 20, 484, 351, 16 ) 
   ::labelStatus                       :  setAlignment( Qt_AlignCenter )
   ::labelStatus:SetText( "I'm a detached Qt Object !!!" )
   ::labelStatus := NIL

   HB_TRACE( HB_TR_DEBUG, "ui_composite:popolate EXIT" )

   RETURN Self


METHOD ui_composite:destroy()
   HB_TRACE( HB_TR_DEBUG, "ui_composite:destroy ENTER" )
   ::labelTitle                        := NIL
   ::groupGets                         := NIL
   ::frameBrowse                       := NIL
   ::listItems                         := NIL
   HB_TRACE( HB_TR_DEBUG, "PRE BUTTON1" )
   ::btnOpt1                           := NIL
   HB_TRACE( HB_TR_DEBUG, "POST BUTTON1" )
   ::btnOpt2                           := NIL
   ::btnOpt3                           := NIL
   ::btnOpt4                           := NIL
   ::labelStatus                       := NIL
   HB_TRACE( HB_TR_DEBUG, "ui_composite:destroy EXIT" )

   RETURN NIL

