cd $PSScriptRoot
clear
Import-Module .\ProductivityTools.PSFindPictures.psm1 -Force

cd d:\Trash\image\
Find-Pictures -verbose -CopyPicturesToDirectory d:\Trash\xx -DeletePictures