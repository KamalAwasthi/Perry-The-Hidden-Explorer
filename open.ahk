#SingleInstance,force
#Include libcrypt.ahk
#Include tf.ahk
gui, font, s10, Verdana 
Gui,Add,Text,, DOUBLE CLICK the file name to OPEN.
Gui, Add, ListView, r20 w700 gMyListView, Name

FileReadLine,current1,ll.txt,1
global source
global Array := Object()

Loop, Read, list%current1%.ka                                        ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine)
	Password := "Password"
	
	Decrypted89 := LC_VxE_Decrypt89( "Password0001",m2:=A_LoopReadLine)
	Reada = %m2%
    LV_Add("",Reada)
}   

gui, font, s11, Verdana
Gui,Add,Button, W100 gClose  X613 Y460,&EXIT
Gui, Show,,Open_A_File
return


newkey:
Gui, 2:Submit, Nohide
FileAppend,        
(
%hotkey%
 
),password.ka
ExitApp
return

/*
DELETE EVENT
*/
change:
FileDelete,password.ka
Gui, 2:Show, w400 h200, New Shortcut
return



MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
 Run,%RowText%
}
ExitApp
return


Close:
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp
