cd $PSScriptRoot
clear
Import-Module .\ProductivityTools.PSFindPictures.psm1 -Force

cd d:\.PawelPC\Photographs\
Find-Pictures -verbose -CopyPicturesToDirectory d:\Trash\xx 