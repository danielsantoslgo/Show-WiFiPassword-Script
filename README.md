# Show-WiFiPassword Script

Este repositorio contiene un script en PowerShell que lista todos los perfiles de Wi-Fi guardados en tu sistema Windows (SSID) junto con sus contraseñas (Key Content).

---

## 📋 Requisitos

- Sistema operativo: Windows 10 o superior
- PowerShell (versión 7 o superior)
- Permisos de administrador para ejecutar comandos `netsh`

---

## 🚀 Instalación

Puedes obtener el script de dos maneras:

### 1. Clonando el repositorio

```bash
git clone https://github.com/tu-usuario/Show-WiFiPassword.git
cd Show-WiFiPassword
```

### 2. Descargando el ZIP

1. Ve a la página del repositorio en GitHub.  
2. Haz clic en **Code** → **Download ZIP**.  
3. Descomprime el archivo y abre la carpeta resultante.

---

## ▶️ Uso

1. Abre PowerShell **como administrador**.  
2. Navega hasta la carpeta donde esté el script:

   ```powershell
   cd C:\ruta\a\Show-WiFiPassword
   ```

3. Ejecuta el script:

   ```powershell
   .\Show-WiFiPassword.ps1
   ```

4. Al finalizar, verás un mensaje:

   ```text
   Presiona ENTER para cerrar...
   ```

   Presiona **ENTER** para cerrar la ventana y terminar la ejecución.

---

## 🛠️ Personalización

- Si deseas cambiar la pausa final o eliminarla, edita la última sección del script:

  ```powershell
  Write-Host "`nPresiona ENTER para cerrar..."
  Read-Host | Out-Null
  ```

- Para soportar otros idiomas modifica los patrones de `Select-String` en el script.

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Puedes:

- Abrir un issue para reportar problemas o sugerir mejoras.
- Enviar un pull request con tus cambios.

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
