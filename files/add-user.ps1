$conn = New-Object Microsoft.SqlServer.Management.Common.ServerConnection -ArgumentList $env:ComputerName
$conn.applicationName = "PowerShell SMO"
$conn.ServerInstance = ".\SQLEXPRESS"
$conn.StatementTimeout = 0
$conn.Connect()
$smo = New-Object Microsoft.SqlServer.Management.Smo.Server -ArgumentList $conn
$SqlUser = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Login -ArgumentList $smo,"${env:ComputerName}\vagrant"
$SqlUser.LoginType = 'WindowsUser'
$sqlUser.PasswordPolicyEnforced = $false
$SqlUser.Create()