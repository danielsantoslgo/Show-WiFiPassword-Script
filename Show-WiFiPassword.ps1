# Este script lista SSID y contraseñas de Wi‑Fi, en inglés y español


# 1. Obtengo salida de netsh
$wifi = netsh.exe wlan show profiles 2>&1

# 2. Chequeo si no hay interfaz inalámbrica (inglés o español)
if ($wifi -match "There is no wireless interface on the system" -or 
    $wifi -match "No hay ninguna interfaz inalámbrica") {
    Write-Output $wifi
    exit
}

# 3. Extraigo líneas con el perfil (soporte inglés y español)
$profileLines = $wifi | Select-String -Pattern '^(?:\s*(?:All User Profile|Perfil de todos los usuarios)\s*:\s*)(.+)$'

if (-not $profileLines) {
    Write-Warning "No se encontraron perfiles de Wi‑Fi guardados en $env:COMPUTERNAME."
    exit
}

# 4. Obtengo lista de SSID
$ListOfSSID = $profileLines | ForEach-Object {
    $_.Matches[0].Groups[1].Value.Trim()
}

Write-Warning "[$(Get-Date)] He encontrado $($ListOfSSID.Count) perfiles de Wi‑Fi en $env:COMPUTERNAME:"

# 5. Para cada SSID, muestro la passphrase (soporte inglés y español)
foreach ($SSID in $ListOfSSID) {
    # redirijo errores a null, por si no hay permisos o no existe el perfil
    $detail = netsh.exe wlan show profile name="$SSID" key=clear 2>$null
    if ($detail) {
        # busco Key Content (inglés) o Contenido de la clave (español)
        $m = $detail | Select-String -Pattern '^(?:\s*(?:Key Content|Contenido de la clave)\s*:\s*)(.+)$'
        if ($m) {
            $passphrase = $m.Matches[0].Groups[1].Value.Trim()
        } else {
            $passphrase = "N/A"
        }
    } else {
        $passphrase = "N/A"
    }
    Write-Output "$SSID : $passphrase"
}

# …resto de tu script…

# Pausa al final para que puedas ver los resultados
Write-Host "`nPresiona ENTER para cerrar..."
Read-Host | Out-Null
