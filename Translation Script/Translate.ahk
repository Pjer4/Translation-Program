#SingleInstance force
phrase := clipboard
LangIn := "ja-JP"
LangOut := "en"
SetTimer, WinMoveMsgBox, 50
MsgBox,4096, Translation, % GoogleTranslate(phrase,LangIn,LangOut)
ID:=WinExist("Translation")
return

WinMoveMsgBox:
ID:=WinExist("Translation")
WinGetPos, Xc, Yc, Width, Height, ahk_id %ID%
x=A_Screenwidth-WidthSetTimer, WinMoveMsgBox, OFF
ID:=WinExist("Translation")
WinMove, ahk_id %ID%, , %x%, 400
return

GoogleTranslate(phrase,LangIn,LangOut)
{
base := "https://translate.google.com.tw/?hl=en&tab=wT#"
path := base . LangIn . "/" . LangOut . "/" . phrase
IE := ComObjCreate("InternetExplorer.Application")
;~ IE.Visible := true
IE.Navigate(path)

While IE.readyState!=4 || IE.document.readyState!="complete" || IE.busy
        Sleep 50

Result := IE.document.all.result_box.innertext
IE.Quit
return Result
}
return 

GuiClose:

ExitApp