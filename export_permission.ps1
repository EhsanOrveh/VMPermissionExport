$primary_vcenter = "Source_vCenter_FQDN_OR_IP"
$Pcredential = Get-Credential

Connect-VIServer -Server $primary_vcenter -Credential $Pcredential


$allvm = get-vm -server $primary_vcenter

foreach($vmname in $allvm)
{
    
    $vm = get-vm -Name $vmname -Server $primary_vcenter
    $per = ($vm).ExtensionData.Permission
    $percount = $per.Count
    $role = @()
    $user = @()
    for($i=0; $i-lt $percount; $i++)
    {
        $role = Get-VIRole -id $per[$i].RoleId -Server $primary_vcenter
        #path on your computer
        $role >> path on your local computer to save permissions\$vmname.txt
        $user = $per[$i].Principal
        #path on your computer
        $user >> path on your local computer to save permissions\new\$vmname.txt
    }
}
