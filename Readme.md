<!--Category:PowerShell--> 
 <p align="right">
    <a href="https://www.powershellgallery.com/packages/ProductivityTools.XXXX/"><img src="Images/Header/Powershell_border_40px.png" /></a>
    <a href="http://productivitytools.tech/XXX/"><img src="Images/Header/ProductivityTools_green_40px_2.png" /><a> 
    <a href="https://github.com/pwujczyk/ProductivityTools.XXX"><img src="Images/Header/Github_border_40px.png" /></a>
</p>
<p align="center">
    <a href="http://http://productivitytools.tech/">
        <img src="Images/Header/LogoTitle_green_500px.png" />
    </a>
</p>

 
# Find Pictures

Module looks in the directory for jpg files and checks if some of them are pictures.

<!--more-->

Module does it by validating if taken date exist for given file. 

Parameters
- CopyPicturesToDirectory - if any picture will be found it can be copied to chosen directory
- DeletePictures - if you don't have the pictures you could delete them from the directory. It is working very nice with CopyPicturesToDirectory

### Installing

````powershell
Install-Module ProductivityTools.FindPictures
````

<!--og-image-->
![](Images/Diagram.png)
gi