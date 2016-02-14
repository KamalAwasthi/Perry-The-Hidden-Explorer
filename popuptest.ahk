^RButton::
#NoEnv  
;#Warn 
SendMode Input  
SetWorkingDir %A_ScriptDir%  
#SingleInstance,force
#Include libcrypt.ahk
/*
*****************************
GLOBALS
**************************
*/
global pass
global source
global Array := Object()
FileReadLine,current1,ll.txt,1
FileReadLine,pass,password.ka,1
IfNotExist,password.ka
{
InputBox, key1, Welcome!, Setup Password , hide
InputBox, key2, Re-Enter Password, Confirm Password , hide
if(key1=key2)
{	
MsgBox,PassWord setup Complete!!
Encrypted89	:=  LC_VxE_Encrypt89( "Password0001",m1:=key1  )
FileAppend,        
(
%m1%

),password.ka
}
else{
MsgBox,Password Did not match!!
return
}
}

FileReadLine,passcode,password.ka,1
Decrypted89 := LC_VxE_Decrypt89( "Password0001",m2:=passcode)
pass=%m2%
;MsgBox,%pass%
/*
	run cmd.exe
	WinWait, ahk_exe cmd.exe 
	SendInput attrib {+}h {+}s "unhide.ahk"{Enter}
	SendInput attrib {+}h {+}s "open.ahk"{Enter}
	SendInput exit{Enter}
*/

Send,{ctrl down}c{ctrl up}
Menu, FileMenu, Add,Hide_This_File,
Menu, FileMenu, Add,Open_A_Hidden_File,
Menu, FileMenu, Add,Unhide_A_File,
Menu, FileMenu, Add,About,
Menu, FileMenu, Add,Help,
Menu, FileMenu, Add,SetUp_Password,
Menu, FileMenu, Add,More_Tools,
Menu FileMenu,Show,


return


About:
MsgBox,0x100040,About,A simple script to hide the files_by`n Kamal Awasthi`n(kamalahktips.blogspot.in)
return

Hide_This_File:
InputBox, passwordcode, Welcome!Enter Password, Enter the Password , hide
if  passwordcode=                           ;IF NONE IS SELECTED , RETURN
	return
;if passwordcode,Cancel
;	return
if (passwordcode=pass)
{

	ClipWait
	FileFullPath=%Clipboard%
	SplitPath,FileFullPath, name, dir, ext, name_no_ext, drive

	MsgBox, 0x24, Hide Files, You want to hide the %name%?
	IfMsgBox,No
		return
	IfMsgBox,Cancel
		return
	run cmd.exe
	WinWait, ahk_exe cmd.exe 
	SendInput attrib {+}h {+}s "%dir%\%name%"{Enter}
	SendInput attrib {+}h {+}s "unhide.ahk"{Enter}
	SendInput attrib {+}h {+}s "open.ahk"{Enter}
	SendInput attrib {+}h {+}s "password.ka"{Enter}
	SendInput attrib {+}h {+}s "list%current1%.ka"{Enter}
	SendInput exit{Enter}
	Password 	:= "Password"
	Encrypted89	:=  LC_VxE_Encrypt89( "Password0001",full:=FileFullPath  )
	FileAppend,        
	(
	%full%

	),list%current1%.ka
}
else{
	MsgBox,Incorrect Password!! Try Again.
}
	;SendInput exit{Enter}
return

Help:
MsgBox, 0,Help,HELP:-`n1.)You can hide your files directly from this simple popup menu by choosing the Hide_This_File option.`n2.)It hides your file so that they can no longer be seen directly going to the folder/subfolder containing it.`n3.)However, the file can be listed by the -ls command on cmd.`n4.)You can open a hidden file without unhidding it.`n5.)You can also unhide a file you have ever hidden.`n6.)You have to setup a password on first run`n6.)You will have to enter the setup password to perform any of the actions described above`n7.)You can also change your password through Setup_Password option given.`n8.)For more help or tools visit Blog Page.`n`nHotekey(ShortCut):- [Ctrl]+[RightClick]`n`t`t`t`n Made By:- Kamal Awasthi(kamalahktips.blogspot.in)        

return

More_Tools:
Browse("http://kamalahktips.blogspot.in/p/authotkey.html")
return


Unhide_A_File:
InputBox, password, Welcome!Enter Password, Enter the Password , hide
if  password=                           ;IF NONE IS SELECTED , RETURN
	return
if (password=pass)
 Run,unhide.ahk
else
{  MsgBox Incorrect Password,Try again by Launching the app again.
}
return

Browse(site){
RegRead, OutputVar, HKEY_CLASSES_ROOT, http\shell\open\command 
  run,% "iexplore.exe" . " """ . site . """"	;internet explorer
}


Open_A_Hidden_File:          
InputBox, password, Welcome!Enter Password, Enter the Password , hide
if  password=                           ;IF NONE IS SELECTED , RETURN
	return

if (password=pass)
	Run,open.ahk
else
{  MsgBox Incorrect Password,Try again by Launching the app again.
}
return

SetUp_Password:
IfNotExist,password.ka
{
InputBox, key1, Welcome!, New Password , hide
InputBox, key2, Re-Enter Password, Confirm Password , hide
if(key1=key2)
{	
MsgBox,PassWord setup Complete!!
Encrypted89	:=  LC_VxE_Encrypt89( "Password0001",m1:=key1  )
FileAppend,        
(
%m1%

),password.ka
}
else{
MsgBox,Password Did not match!!
return
}
}
else
{
	InputBox, password, Welcome!Enter Password, Enter the Password , hide
if  password=                           ;IF NONE IS SELECTED , RETURN
return

FileDelete,password.ka
InputBox, key1, Welcome!, New Password , hide
InputBox, key2, Re-Enter Password, Confirm Password , hide
if(key1=key2)
{	
MsgBox,PassWord setup Complete!!
Encrypted89	:=  LC_VxE_Encrypt89( "Password0001",m1:=key1  )
FileAppend,        
(
%m1%

),password.ka
}
else{
MsgBox,Password Did not match!!
return
}

}
return

Close:
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp
return
