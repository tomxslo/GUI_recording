Gui, Add, Button, w200 h50 gTest1 , Run Recording channel
Gui, Add, Button, w200 h50 gTest2 , Run Record datetime
Gui, Add, Button, w200 h50 gTest3 , Run Automatic
Gui, Add, Link,, <a href="http://redman.myftp.org/menu_soccer.html">Soccer</a> <a href="http://redman.myftp.org/menu_all.html">ALL</a>
Gui, Show,, Recording
global IE_Connect := new IE_Events
Gui, Add, ActiveX, w500 h500 vWB, Shell.Chrome
WB.Navigate("http://redman.myftp.org/soccer.html")
Gui, Show, w510 h700
ComObjConnect(WB, IE_Connect)
Return

/* 
support ESC key to close windows in Recording program
*/
#IfWinActive Program recording

{
~Escape::
      Send !{F4}
return
}


#IfWinActive, Datetime recording

{
~Escape::
      Send !{F4}
return
}

#IfWinActive, Keywords recording

{
~Escape::
      Send !{F4}
return
}


Test1:
#singleinstance force
Gui 2:+Resize -MaximizeBox -MinimizeBox
Gui, 2:Submit, NoHide
Gui, 2:Destroy
Gui, 2:Add, Text, x12 y05 , Enter recording options
Gui, 2:Add, Text, x12 y30 w120 h30, Please enter channel number:
Gui, 2:Add, Text, x12 y60 w120 h30, Please enter duration:
Gui, 2:Add, Text, x12 y90 w120 h30, Please enter filename:
Gui, 2:Add, Text, x12 y120 w120 h30, Enter program location:
Gui, 2:Add, Edit, x120 y30 w60 h20 gLIMIT Limit3 vUserInput,01
Gui, 2:Add, Edit, x120 y60 w60 h20 gLIMIT Limit3 vUserInput2,02
Gui, 2:Add, Edit, x120 y90 w60 h20 vUserInput3,filename
Gui, 2:Add, Edit, x120 y120 w150 h20 vUserInput4,"C:\SS1\StreamCapture.exe"
Gui, 2:Add, Button, Default x+10 w50 gA1, OK
Gui, 2:Show, AutoSize, Program recording





LIMIT: 
Gui, 2:Submit, NoHide 
return


a1:
Gui,2:submit,nohide
Run %UserInput4% --channels %UserInput% --duration %UserInput2% --filename %UserInput3%
Gui, 2:destroy
return
ExitApp


Test2:
FormatTime, date,, dd/MM/yyyy
FormatTime, Time,T12, hh:mm
#singleinstance force
Gui  3:+Resize -MaximizeBox -MinimizeBox
Gui, 3:Submit, NoHide
Gui, 3:Destroy
Gui, 3:Add, Text, x12 y05 , Enter recording options
Gui, 3:Add, Text, x12 y30 w120 h30, Please enter channel number:
Gui, 3:Add, Text, x12 y60 w120 h30, Please enter duration:
Gui, 3:Add, Text, x12 y90 w120 h30, Please enter filename:
Gui, 3:Add, Text, x12 y120 w120 h30, Please enter datetime:
Gui, 3:Add, Text, x12 y150 w120 h30, Enter program location:
Gui, 3:Add, Edit, x120 y30 w60 h20 gLIMIT3 Limit3 vUserInput,01
Gui, 3:Add, Edit, x120 y60 w60 h20 gLIMIT3 Limit3 vUserInput2,02
Gui, 3:Add, Edit, x120 y90 w60 h20 vUserInput3,filename
Gui, 3:Add, Edit, x120 y120 w120 h20 vUserInput4,"%date% %Time%"
Gui, 3:Add, Edit, x120 y150 w150 h20 vUserInput5,"C:\SS1\StreamCapture.exe"
Gui, 3:Add, Button, Default x+10 w50 gA2, OK
Gui, 3:Show, w350, Datetime recording
LIMIT3: 
Gui, 3:Submit, NoHide 
Return



a2:
Gui, 3:submit,nohide
Run %UserInput5% --channels %UserInput% --duration %UserInput2% --filename %UserInput3% --datetime %UserInput4%
Gui, 3:destroy
return
ExitApp


Test3:
#singleinstance force
SetWorkingDir, c:\\SS1
UserInput=C:\SS1\
Gui 4:+Resize -MaximizeBox -MinimizeBox
Gui, 4:Submit, NoHide
Gui, 4:Destroy
Gui, 4:Add, Text, x12 y30 w120 h30, Settings:
Gui, 4:Add, Edit, x120 y30 w150 h20 vUserInput,C:\SS1\
gui, 4:add, Button, x10 y60 h30 w60 gsub1, Keywords
Gui, 4:Add, Button, Default x190 y60 h30 w60 gA3, OK
Gui, 4:Show, w300, Automatic recording

Return

sub1:
 {
run,c:\Program Files (x86)\Notepad++\notepad++.exe %UserInput%appsettings.json    
run,c:\Program Files (x86)\Notepad++\notepad++.exe %UserInput%keywords.json
    
 }



LIMIT4: 
Gui, 4:Submit, NoHide
Return 

a3:
Gui, 4:submit,nohide
Run "%UserInput%StreamCapture.exe"
Gui, 4:destroy
return
ExitApp

GuiClose:		;close Gui to Exit


ExitApp


