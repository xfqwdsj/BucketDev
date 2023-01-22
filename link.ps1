Get-ChildItem -Path "$dir\$component" | ForEach-Object {
    $source = "$target_dir\$($_.Name)"

    if ($_.PSIsContainer) {
        New-Item -Path $source -ItemType Junction -Value $_
        attrib $source +r /l
    } else {
        New-Item -Path $source -ItemType HardLink -Value $_
    }
}
