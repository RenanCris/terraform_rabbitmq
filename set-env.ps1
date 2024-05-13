Get-Content .env | ForEach-Object {
    $envVar = $_ -split '=', 2
    $envVarName = $envVar[0].Trim()
    $envVarValue = $envVar[1].Trim()
    [System.Environment]::SetEnvironmentVariable($envVarName, $envVarValue, [System.EnvironmentVariableTarget]::Process)
};