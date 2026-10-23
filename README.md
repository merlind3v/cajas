# cajas

Script para instalar herramientas de oficina, PDF, gráficos, fuentes e impresión en Arch Linux / CachyOS.

## Instalación

Como usuario normal (no root):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/merlind3v/cajas/main/install.sh)
```

Pide la contraseña de `sudo`, puede que más de una vez. Tarda un buen rato: los paquetes de AUR se compilan en el momento.

## Qué instala

| Grupo | Paquetes |
|---|---|
| Oficina | `libreoffice-fresh`, `libreoffice-fresh-es`, `onlyoffice-bin` (AUR) |
| PDF | `okular`, `pdfarranger`, `masterpdfeditor-free` (AUR) |
| Gráficos | `gimp`, `inkscape` |
| Fuentes | `ttf-ms-fonts`, `ttf-vista-fonts` (AUR) |
| Impresión y escaneo | `cups`, `print-manager`, `system-config-printer`, `gutenprint`, `foomatic-db-gutenprint-ppds`, `simple-scan` |

Además activa el servicio de impresión `cups`.

## Requisitos

- Arch Linux o derivada (CachyOS, EndeavourOS…).
- [`paru`](https://github.com/Morganamilo/paru) instalado, para los paquetes de AUR.

## Notas

- Se puede correr más de una vez: los paquetes ya instalados se saltean.
- Tres contraseñas de `sudo` incorrectas seguidas bloquean la cuenta 10 minutos; aun con la contraseña correcta va a fallar hasta que pase ese tiempo.
