if( (Get-ChildItem "$ProgramFiles_x86\ABC" | Measure-Object).Count -eq 0)
        {
            Remove-Item "$ProgramFiles_x86\ABC" -Recurse -Force
        }
