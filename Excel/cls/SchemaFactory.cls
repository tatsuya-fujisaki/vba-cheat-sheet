Option Explicit

Private directoryPath As String

Sub Init(ByVal directoryPath1 As String, ByVal file As String, ByVal hasHeader As Boolean)
    Dim schema As String
    schema = directoryPath1 & "\" & "Schema.ini"
    Dim fn As Integer
    fn = FreeFile
    Open schema For Output As #fn
    Print #fn, "[" & file & "]"
    Print #fn, "Format=CSVDelimited"
    Print #fn, "ColNameHeader=" & hasHeader
    Close fn
    directoryPath = directoryPath1
End Sub

Private Sub Class_Terminate()
    Dim filePath As String
    filePath = directoryPath & "\" & "Schema.ini"
    If dir(filePath) <> "" Then Kill filePath
End Sub