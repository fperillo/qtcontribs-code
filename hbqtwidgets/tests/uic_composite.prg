/* WARNING: Automatically generated source file. DO NOT EDIT! */

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

//   VAR    oWidget
   VAR    Dialog
   VAR    labelTitle
   VAR    groupGets
   VAR    frameBrowse
   VAR    listItems
   VAR    btnOpt1
   VAR    btnOpt2
   VAR    btnOpt3
   VAR    btnOpt4
   VAR    labelStatus

   // METHOD init( oParent )
   ACCESS widget()                                INLINE ::oWidget
   METHOD destroy()
   METHOD retranslate()
   METHOD popolate()

   ERROR HANDLER __OnError( ... )


   ENDCLASS


METHOD ui_composite:popolate(oParent)

//   ::oWidget                           := QDialog( oParent )
//   ::Dialog                            := ::oWidget

//   ::Dialog                            :  setObjectName( e"Dialog" )
//   ::Dialog                            :  resize( 481, 519 )

//    ::Dialog := Self

//   ::setObjectName( e"Dialog" )
   ::resize( 481, 519 )

   ::labelTitle                        := QLabel( Self )
   ::labelTitle                        :  setObjectName( e"labelTitle" )
   ::labelTitle                        :  setGeometry( QRect( 20, 10, 441, 20 ) )
   ::labelTitle                        :  setAlignment( Qt_AlignCenter )
   ::groupGets                         := QGroupBox( Self )
   ::groupGets                         :  setObjectName( e"groupGets" )
   ::groupGets                         :  setGeometry( QRect( 20, 40, 441, 151 ) )
   ::frameBrowse                       := QFrame( Self )
   ::frameBrowse                       :  setObjectName( e"frameBrowse" )
   ::frameBrowse                       :  setGeometry( QRect( 20, 200, 351, 271 ) )
   ::frameBrowse                       :  setFrameShape( QFrame_Box )
   ::frameBrowse                       :  setFrameShadow( QFrame_Plain )
   ::listItems                         := QListWidget( Self )
   ::listItems                         :  setObjectName( e"listItems" )
   ::listItems                         :  setGeometry( QRect( 380, 200, 81, 181 ) )
   ::btnOpt1                           := QPushButton( Self )
   ::btnOpt1                           :  setObjectName( e"btnOpt1" )
   ::btnOpt1                           :  setGeometry( QRect( 380, 390, 81, 23 ) )
   ::btnOpt2                           := QPushButton( Self )
   ::btnOpt2                           :  setObjectName( e"btnOpt2" )
   ::btnOpt2                           :  setGeometry( QRect( 380, 420, 81, 23 ) )
   ::btnOpt3                           := QPushButton( Self )
   ::btnOpt3                           :  setObjectName( e"btnOpt3" )
   ::btnOpt3                           :  setGeometry( QRect( 380, 450, 81, 23 ) )
   ::btnOpt4                           := QPushButton( Self )
   ::btnOpt4                           :  setObjectName( e"btnOpt4" )
   ::btnOpt4                           :  setGeometry( QRect( 380, 480, 81, 23 ) )
   ::labelStatus                       := QLabel( Self )
   ::labelStatus                       :  setObjectName( e"labelStatus" )
   ::labelStatus                       :  setGeometry( QRect( 20, 484, 351, 16 ) )
   ::labelStatus                       :  setAlignment( Qt_AlignCenter )
   ::labelStatus:SetText( "I'm a detached Qt Object !!!" )
   ::labelStatus := NIL
   // ::retranslate( ::Dialog )

   RETURN Self


METHOD ui_composite:retranslate()

   ::Dialog                            :  setWindowTitle( QApplication(  ) :  translate( e"Dialog", e"Customer Invoices Information", e"" ) )
   ::labelTitle                        :  setText( QApplication(  ) :  translate( e"Dialog", e"Customer Invoice Details", e"" ) )
   ::groupGets                         :  setTitle( e"" )
   ::btnOpt1                           :  setText( QApplication(  ) :  translate( e"Dialog", e"Option 1", e"" ) )
   ::btnOpt2                           :  setText( QApplication(  ) :  translate( e"Dialog", e"Option 2", e"" ) )
   ::btnOpt3                           :  setText( QApplication(  ) :  translate( e"Dialog", e"Option 3", e"" ) )
   ::btnOpt4                           :  setText( QApplication(  ) :  translate( e"Dialog", e"Option 4", e"" ) )
   ::labelStatus                       :  setText( QApplication(  ) :  translate( e"Dialog", e"Status of Invoice", e"" ) )

   RETURN NIL


METHOD ui_composite:destroy()
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

//   ::oWidget                           :setParent( QWidget() )
//   ::oWidget                           := NIL
   // ::disconnect()

   RETURN NIL


METHOD ui_composite:__OnError( ... )
   LOCAL cMsg                          := __GetMessage()
   LOCAL oError


HB_TRACE( HB_TR_DEBUG, "On error:"+cMsg )

   IF SubStr( cMsg, 1, 1 ) == "_"
      cMsg                             := SubStr( cMsg, 2 )
   ENDIF

   IF Left( cMsg, 2 ) == "Q_"
      IF __objHasMsg( Self, SubStr( cMsg, 3 ) )
         cMsg                          := SubStr( cMsg, 3 )
         RETURN                        ::&cMsg
      ELSE
         WITH OBJECT oError            := ErrorNew()
                                       :severity    := ES_ERROR
                                       :genCode     := EG_ARG
                                       :subSystem   := "HBQT" 
                                       :subCode     := 1001
                                       :canRetry    := .F.
                                       :canDefault  := .F.
                                       :args        := hb_AParams()
                                       :operation   := ProcName()
                                       :description := hb_StrFormat("Control <%s> does not exist",SubStr( cMsg, 3 ))
         ENDWITH

         Eval( ErrorBlock(), oError )
      ENDIF
   ELSEIF ! Empty( ::oWidget )
      RETURN                           ::oWidget:&cMsg( ... )
   ENDIF

   RETURN NIL


