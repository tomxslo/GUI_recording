Gui, Add, Button, w200 h50 gTest1 , Run Recording channel
Gui, Add, Button, w200 h50 gTest2 , Run Record datetime
Gui, Add, Button, w200 h50 gTest3 , Run Record keywords
Gui, Show,, Recording
Return

Test1:
#singleinstance force
InputBox, UserInput, Channel Number, Please enter channel number., , 150,150,,,,,01

if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput2, Duration in minutes, Please enter duration., , 150,150,,,,,1
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput3, Please enter filename, Please enter filename., , 150,150,,,,,Filename.txt
if ErrorLevel = 1
   return
else

Run "C:\SS\StreamCapture.exe" --channels %UserInput% --duration %UserInput2% --filename %UserInput3%
Return

Test2:
FormatTime, date,, dd/MM/yyyy
FormatTime, time,, hh:mm

#singleinstance force
InputBox, UserInput, Channel Number, Please enter channel number., , 150,150,,,,,01
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput2, Duration in minutes, Please enter duration., , 150,150,,,,,1
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput3, Please enter filename, Please enter filename., , 150,150,,,,,Filename.txt
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput4, Date, Please enter datetime, , 150,150,,,,,"%date% %time%"
if ErrorLevel = 1
   return
else

Run "C:\SS\StreamCapture.exe" --channels %UserInput% --duration %UserInput2% --filename %UserInput3% --datetime %UserInput4%
Return

Test3:
#singleinstance force
InputBox, UserInput, Keywords, Please enter keywords:., , 150,150,,,,,Liverpool
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput2, Pre, How many prem minutes?, , 150,150,,,,,10
if ErrorLevel = 1
   return
else

#singleinstance force
InputBox, UserInput3, Post, How many post minutes?, , 150,150,,,,,10
if ErrorLevel = 1
   return
else


Run "C:\SS\StreamCapture.exe" --keywords "%UserInput%|%UserInput2%|%UserInput3%
Return



GuiClose:
ExitApp
