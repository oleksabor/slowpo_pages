param([string]$title, [string]$tags, [string]$category, [string]$dateO)
$date = Get-Date

if ($dateO -ne "") {
	if ([System.DateTime]::TryParse($dateO, [ref]$date) -eq $true) {
	$date = $date.AddMinutes((Get-Date).TimeOfDay.TotalMinutes);
	}
}

$now = $date.ToString("yyyy-MM-dd HH:mm K");

function transliterate([string] $text){
	$s = @( 'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ь', 'ю', 'я'
	,'А', 'Б', 'В', 'Г', 'Ґ', 'Д', 'Е', 'Є', 'Ж', 'З', 'И', 'І', 'Ї', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ь', 'Ю', 'Я'
	, "`'")
	
	$d = @( 'a', 'b', 'v', 'g', 'g', 'd', 'e', 'e', 'zh', 'z', 'y', 'i', 'i', 'y', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shc', '', 'yu', 'ya'
	,
	'A', 'B', 'V', 'G', 'G', 'D', 'E', 'E', 'Zh', 'Z', 'Y', 'I', 'I', 'Y', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'H', 'Ts', 'Ch', 'Sh', 'Shc', '', 'Yu', 'Ya'
	, '');
	
	for ($i = 0; $i -lt $s.Length; $i++)
	{
		if ($text.Contains($s[$i])) {
			$text = $text.Replace($s[$i], $d[$i])
		}
	}
	$a = '';
	return $text
}

$content  = @()
$content  += "---"
$content  += "layout: post"
$content  += "title: $title"
$content  += "date: $now" 


if ($tags -ne "") {
	Write-host "tags $tags";
	$content += "tags: [$tags]"
}
if ($category -ne "") {
	Write-host "category $category";
	$content += "category: $category"
}
$content  += "---"



$content -join "`n";

$titleTR = transliterate($title);

$titlewords = $titleTR.Split(" ") | where {$_.Length -gt 1};

$fn = -join ("_posts/", $date.ToString("yyyy-MM-dd"), "-");

$fn += $titlewords -join "-" ;
$fn += ".md";

$fn

$content | Out-File -FilePath $fn

& "notepad++" $fn #open in notepad to edit



