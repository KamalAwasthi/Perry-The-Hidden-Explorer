#SingleInstance,force
#Include libcrypt.ahk
#Include tf.ahk
Gui, 2:Font, S16 CBlue,  Verdana 
Gui, 2:Add, Text, x40 y10 w400 h25  , Change Your Password 
Gui, 2:Font, S14 CBlue,  Verdana 
Gui, 2:Add, Text, x20 y70 w150 h20 , Active Password
Gui, 2:Font, S12 CBlack,  Verdana 
Gui, 2:Add, Edit, x160 y70 w220 h22 vhotkey
Gui, 2:Font, S10 CBlue,  Verdana 
Gui, 2:Add, Button,x300 y100 gnewkey,&Save

; Create the ListView with a column, Name:
gui, font, s10, Verdana 
Gui,Add,Text,, DOUBLE CLICK the file name to UNHIDE.
Gui, Add, ListView, r20 w700 gMyListView, Name


global j
global u

FileReadLine,current1,ll.txt,1
FileReadLine,current2,ll.txt,2
FileReadLine,current3,ll.txt,3

global source
global Array := Object()


Loop, Read, list%current1%.ka                                         ;LOOP TO READ THE BUTTON FILE
{
    Array.Insert(A_LoopReadLine)
	Password := "Password"
	
	Decrypted89 := LC_VxE_Decrypt89( "Password0001",m2:=A_LoopReadLine)
	Reada = %m2%
    LV_Add("",Reada)
}          

gui, font, s11, Verdana
Gui,Add,Button, W100 gClose  X613 Y460,&EXIT
Gui, Show,,HIDDENVIEW

return


newkey:
Gui, 2:Submit, Nohide
FileAppend,        
(
%hotkey%
 
),password.ka
ExitApp
return

change:
FileDelete,password.ka
Gui, 2:Show, w400 h200, New Shortcut
return



MyListView:
if A_GuiEvent = DoubleClick
{
    LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
	run cmd.exe
WinWait, ahk_exe cmd.exe 
SendInput attrib {-}h {-}s "%RowText%"{Enter}
SendInput exit{Enter}
 Loop, Read, list%current1%.ka                                           ;LOOP TO READ THE BUTTON FILE
{
			current3:=current3+1
	
	if(current3 =A_EventInfo)
	{continue
	}
	
	
    FileAppend,        
   (
   %A_LoopReadline%
 
   ),list%current2%.ka

}

}

FileDelete, list%current1%.ka
m:=current1+1
l:=current2+1

TF_ReplaceLine("!ll.txt", 1, 1, m)
TF_ReplaceLine("!ll.txt", 2, 2, l)
ExitApp
return

Close:
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp
