$goPath = [System.IO.Directory]::GetCurrentDirectory();
$env:GOPATH = $goPath;
$env:CGO_CPPFLAGS = "-I $goPath\includes";
$env:CGO_LDFLAGS = "-L $goPath\libs";
go install cmd/imposm;
copy libs\* bin;
