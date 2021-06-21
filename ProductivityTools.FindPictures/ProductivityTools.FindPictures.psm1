function LoadSystemDrawing() {
	Write-Verbose "Loading system drawing assembly"
	[reflection.assembly]::loadfile( "C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.Drawing.dll") | Out-Null
}

function HasCreationDate {
	[cmdletbinding()]	
	param($objectPath)
	
	$image = New-Object System.Drawing.Bitmap("$objectPath")
	try {
		$date = $image.GetPropertyItem(36867).value[0..9]
		$image.Dispose();
		return $true
	}
	catch {	
		Write-Verbose "Date taken haven't been found, probably picture is image (doesn't have the date taken property)[$objectPath]"
		$image.Dispose();
		return $false
	}
}

function FindPictures {

	[cmdletbinding()]
	param([string]$Directory, [string]$CopyPicturesToDirectory, [switch]$DeletePictures)

	$result = @();

	$items = Get-ChildItem -Path $Directory -Recurse -Filter *.jpg | select FullName
	foreach ($item in $items) {

		$objectPath = $item.FullName
		Write-Verbose "Processing file $objectPath"
		$creationDateExists = HasCreationDate $objectPath
		if ($creationDateExists -eq $false) {
			$result += $objectPath
			if ($CopyPicturesToDirectory -ne '') {
				if ($(Test-Path $CopyPicturesToDirectory) -eq $false) {
					New-Item -Path $CopyPicturesToDirectory -ItemType Directory
				}
				Write-Verbose "Copying picture $item to $CopyPicturesToDirectory"
				Copy-Item -Path $objectPath -Destination $CopyPicturesToDirectory
			}
			
			if ($DeletePictures.IsPresent) {
				Write-Verbose "Deleting picture $item"
				Remove-Item -Path $objectPath
			}
		}
	}
	return $result;
}

function Find-Pictures {

	[cmdletbinding()]
	param([string]$Directory = $(Get-Location), [string]$CopyPicturesToDirectory, [switch]$DeletePictures)

	LoadSystemDrawing
	$r = FindPictures -Directory $Directory -CopyPicturesToDirectory:$CopyPicturesToDirectory -DeletePictures:$DeletePictures
	return $r;
}

Export-ModuleMember Find-Pictures