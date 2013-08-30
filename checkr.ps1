$emailPath = "C:\Users\adavies.WCSKS\Downloads\PSEmailData.csv"
$activeServerPath = "C:\Users\adavies.WCSKS\Downloads\ActiveServerData (2).csv"
 
$ADUsers = Import-Csv $activeServerPath
$emailUsers = Import-Csv $emailPath | Select -ExpandProperty Email
 
foreach($user in $ADUsers) 
{
    $fullUser = $user.Name + $user.Domain
    if ($emailUsers -notcontains $fullUser)
    {
        echo ("The user, " + $fullUser + ",  does not match.")
    }
}