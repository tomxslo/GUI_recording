Gui, Add, Button, w200 h50 gTest1 , Run Recording channel
Gui, Add, Button, w200 h50 gTest2 , Run Record datetime
Gui, Add, Button, w200 h50 gTest3 , Run Record keywords
Gui, Show,, Recording
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
Gui, 2:Add, Edit, x120 y30 w60 h20 gLIMIT Limit3 vUserInput,01
Gui, 2:Add, Edit, x120 y60 w60 h20 gLIMIT Limit3 vUserInput2,02
Gui, 2:Add, Edit, x120 y90 w60 h20 vUserInput3,filename
Gui, 2:Add, Button, Default x+10 w50 gA1, OK
Gui, 2:Show, AutoSize, Program recording



LIMIT: 
Gui, 2:Submit, NoHide 
return


a1:
Gui,2:submit,nohide
Run "C:\SS\StreamCapture.exe" --channels %UserInput% --duration %UserInput2% --filename %UserInput3%
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
Gui, 3:Add, Edit, x120 y30 w60 h20 gLIMIT3 Limit2-3 vUserInput,01
Gui, 3:Add, Edit, x120 y60 w60 h20 gLIMIT3 Limit3 vUserInput2,02
Gui, 3:Add, Edit, x120 y90 w60 h20 vUserInput3,filename
Gui, 3:Add, Edit, x120 y120 w120 h20 vUserInput4,"%date% %Time%"
Gui, 3:Add, Button, Default x+10 w50 gA2, OK
Gui, 3:Show, w300, Datetime recording
LIMIT3: 
Gui, 3:Submit, NoHide 
Return



a2:
Gui, 3:submit,nohide
Run "C:\SS\StreamCapture.exe" --channels %UserInput% --duration %UserInput2% --filename %UserInput3% --datetime %UserInput4%
Gui, 3:destroy
return
ExitApp


Test3:
#singleinstance force
Gui 4:+Resize -MaximizeBox -MinimizeBox
Gui, 4:Submit, NoHide
Gui, 4:Destroy
Gui, 4:Add, Text, x12 y05 , Enter recording options
Gui, 4:Add, Text, x12 y30 w120 h30, Keywords:
Gui, 4:Add, Text, x12 y60 w120 h30, Before min?
Gui, 4:Add, Text, x12 y90 w120 h30, After min?
Gui, 4:Add, Edit, x120 y30 w60 h20 vUserInput,Keywords
Gui, 4:Add, Edit, x120 y60 w60 h20 gLIMIT4 Limit3 vUserInput2,10
Gui, 4:Add, Edit, x120 y90 w60 h20 gLIMIT4 Limit3 vUserInput3,10
Gui, 4:Add, Button, Default x+10 w50 gA3, OK
Gui, 4:Show, w250, Keywords recording

LIMIT4: 
Gui, 4:Submit, NoHide
Return 

a3:
Gui, 4:submit,nohide
Run "C:\SS\StreamCapture.exe" --keywords "%UserInput%|%UserInput2%|%UserInput3%
Gui, 4:destroy
return
ExitApp

GuiClose:		;close Gui to Exit

ExitApp


