
#example regex with groups
$regex = New-Object -TypeName RegEx -ArgumentList '((?<=\[)(.*?)(?=\]))|((\d{4}\-\d{2}\-\d{2}))|((?<=\d{2}\:\d{2}\:\d{2}\s)\w+(?=\s))|((?<=\s\()(.*?)(?=\),\s))','compiled'
$sr = New-Object System.IO.StreamReader("C:\temp\read.txt") 
$results = $regex.Matches($sr.ReadToEnd())
$sr.Close()
$sw = New-Object System.IO.StreamWriter("C:\temp\writ.txt")
ForEach($result in $results.GetEnumerator()) {
    $sw.WriteLine($result.value[0] + "," + $result.value[1] + "," + $result.value[2] + "," + $result.value[3])
}
$sw.Close()
