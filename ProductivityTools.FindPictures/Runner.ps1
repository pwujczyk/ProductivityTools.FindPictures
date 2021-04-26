cd $PSScriptRoot
clear
Import-Module .\ProductivityTools.FindPictures.psm1 -Force

cd d:\.PawelPC\Photographs\
Find-Pictures -verbose -CopyPicturesToDirectory d:\Trash\xx 