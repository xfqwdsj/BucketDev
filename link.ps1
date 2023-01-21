$target_dir = "$(persistdir android-sdk-base $global)\$(([string]$app).Substring(12))"
Remove-Item -Path "$target_dir\*" -Force -Recurse

Get-ChildItem $dir | ForEach-Object {
    $source = "$target_dir\$($_.Name)"

    if (is_directory $source) {
        New-Item -Path $source -ItemType Junction -Value $_
        attrib $source +r /l
    } else {
        New-Item -Path $source -ItemType HardLink -Value $_
    }
}
