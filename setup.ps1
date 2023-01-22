$component = ([string]$app).Substring(12)
$target_dir = "$(persistdir android-sdk-base $global)\$component"
Remove-Item -Path "$target_dir\*" -Force -Recurse
