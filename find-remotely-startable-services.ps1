Get-WmiObject win32_service |
  select @{Name="sd";expression={[string](sc.exe sdshow $_.Name)[1] }}, Name, DisplayName, PathName, Description |
  Where-Object {$_.sd -Match "[^(]+\([^)]*RP[^)]*;;;BU\)"} |
  Where-Object {$_.PathName -NotMatch "svchost"} |
  fl