Option Explicit

Private Sub Printf(ByVal format As String, ParamArray args())
    Dim i As Long
    For i = 0 To UBound(args)
        format = Replace(format, "{" & i & "}", args(i))
    Next
    Debug.Print format
End Sub

Private Function StringFormat(ByVal format As String, ParamArray args()) As String
    Dim i As Long
    For i = 0 To UBound(args)
        format = Replace(format, "{" & i & "}", args(i))
    Next
    StringFormat = format
End Function

Private Function ColToCsv(ByVal sh As Worksheet, ByVal columnIndex As Long) As String
    ColToCsv = vbNullString
    Dim e As Variant
    For Each e In WorksheetFunction.Transpose(GetColumn(Me, columnIndex))
        ColToCsv = ColToCsv & ", " & Quote(e)
    Next
    ColToCsv = Bracket(Mid$(ColToCsv, 3))
End Function

Private Function GetUnifiedNewLines(ByVal s As String) As String
    GetUnifiedNewLines = Replace(Replace(s, vbCrLf, vbLf), vbCr, vbLf)
End Function

Private Function GetTailingNewLinesRemoved(ByVal s As String) As Variant
    Do While Right$(s, 1) = vbLf
        s = Left$(s, Len(s) - 1)
    Loop
    GetTailingNewLinesRemoved = s
End Function

Private Function Contains(ByVal s As String, ByVal findMe As String) As Boolean
    Contains = InStr(1, s, findMe, vbTextCompare)
End Function

Private Function GetSubstringCount(ByVal s As String, ByVal substring As String) As Long
    GetSubstringCount = (Len(s) - Len(Replace(s, substring, vbNullString))) / Len(substring)
End Function

Private Function LTruncate(ByVal s As String, ByVal n As Long) As String
    LTruncate = Mid$(s, n + 1) 'Delete first n and last n characters
End Function

Private Function RTruncate(ByVal s As String, ByVal n As Long) As String
    RTruncate = Left$(s, Len(s) - n) 'Delete last n characters
End Function

Private Function LRTruncate(ByVal s As String, ByVal n As Long) As String
    'The function name LRTrim is a compromise because "Trim" is reserved
    LRTruncate = Mid$(s, n + 1, Len(s) - 2 * n) 'Delete first n characters
End Function
