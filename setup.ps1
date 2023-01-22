$component = ([string]$app).Substring(12)
$target_dir = "$(persistdir android-sdk-base $global)\$component"

Get-ChildItem -Path "$target_dir\*" | ForEach-Object {
    if ($_.Attributes -band [IO.FileAttributes]::ReparsePoint) {
        $_.Delete()
    } else {
        Remove-Item -Path $_ -Recurse -Force
    }
}
