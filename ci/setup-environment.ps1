param(
    [Parameter(Mandatory=$true)] [string]$RepoName,
    [Parameter(Mandatory=$true)] [string]$JavaSDKEnvVar
)

./java/setup-enviroment.ps1 @PSBoundParameters
