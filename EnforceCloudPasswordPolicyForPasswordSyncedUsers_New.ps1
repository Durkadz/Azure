#Connect to Azure
Connect-AzureAD
#Declarate Variables
$GroupId = "2a970a5b-17d4-4ae0-941c-d58fd2578d4c"
$Users =  Get-AzureADGroupMember -ObjectId $GroupId | Select ObjectId, PasswordPolicies
#Get only users that don´t have property None in the PasswordPolicies attribute.
ForEach($User in $Users) {
   
   If ($User.PasswordPolicies -ne "None"){
       Set-AzureADUser -ObjectId $User.ObjectID -PasswordPolicies None
       
    }   

}

