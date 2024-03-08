# portable_vim
Versión portable y personalizada de Vim para Linux ya testeado en Ubuntu 20.04 en los ordenadores de prácticas de la ETSIIT UGR.

## Instrucciones de uso
Clonar los archios del repositorio (o usar .vimrc / .vim propios) y ejecutar el script ugr_vim_setup_lite.sh con un argumento: el nombre del USB donde estén guardados
el .vimrc y .vim
Quedarán los archivos de configuración en el sitio apropiado y solo quedará hacer una ejecución de `source .bash_profile` para que quede actualizada la variable
$PATH y pueda ejecutarse Vim como usualmente. 

Importante: quedan switcheados la tecla Ctrl y Caps-Lock. Si no se desesa este efecto, comentar la última línea del script.
