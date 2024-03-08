# portable_vim
Versión portable y personalizada de Vim para Linux ya testeado en Ubuntu 20.04 en los ordenadores de prácticas de la ETSIIT UGR. Contamina el $HOME, pero eso da igual en un ordenador de prácticas.

## Instrucciones de uso
Clonar los archivos del repositorio (o usar .vimrc / .vim propios) y ejecutar el script ugr_vim_setup_lite.sh con un argumento: el nombre del USB (o directorio) donde estén guardadosel .vimrc, .vim y vim.tgz
Quedarán los archivos de configuración en el sitio apropiado y solo quedará hacer una ejecución de `source .bash_profile` para que quede actualizada la variable
$PATH y pueda ejecutarse Vim como usualmente. 

Importante: quedan switcheados la tecla Ctrl y Caps-Lock. Si no se desesa este efecto, comentar la última línea del script.
