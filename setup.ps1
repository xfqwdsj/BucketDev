$component = ([string]$app).Substring(12)
$target_dir = "$(persistdir android-sdk-base $global)\$component"

attrib -r "$target_dir\*" /l
Remove-Item -Path "$target_dir\*" -Recurse -Force
