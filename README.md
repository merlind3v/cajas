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
| Drivers de impresora | `brlaser` (Brother DCP-1510), `cnijfilter2` (Canon G2070) (AUR) |

Además activa el servicio de impresión `cups`.

## Impresoras

Con las impresoras enchufadas por USB y encendidas, después de `install.sh`:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/merlind3v/cajas/main/printers.sh)
```

Crea (o actualiza) estas colas en CUPS:

| Cola | Impresora | Driver |
|---|---|---|
| `DCP-1510-series` | Brother DCP-1510 | `brlaser`, modelo exacto |
| `Canon_G2070` | Canon G2070 | `cnijfilter2`, el oficial de Canon, con su conexión `cnijbe2://` |

Para probar: `lp -d <cola> /usr/share/cups/data/testprint`.

## Requisitos

- Arch Linux o derivada (CachyOS, EndeavourOS…).
- [`paru`](https://github.com/Morganamilo/paru) instalado, para los paquetes de AUR.

## Notas

- Se puede correr más de una vez: los paquetes ya instalados se saltean.
- La Canon G2070 no imprime con el driver de Gutenprint "Canon G2000 series": CUPS da el trabajo por enviado y la impresora no hace nada. Hace falta `cnijfilter2`.
- En caja2 el puerto USB 3.0 conectado directo a la placa (`1-1` en `journalctl -k`) no sirve para impresoras: la Brother no llegaba a conectarse (`error -71`) y la Canon se desconectaba cada pocos segundos a mitad de un trabajo. En los otros puertos andan las dos.
- Tres contraseñas de `sudo` incorrectas seguidas bloquean la cuenta 10 minutos; aun con la contraseña correcta va a fallar hasta que pase ese tiempo.
