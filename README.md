# portable_vim
Versión portable y personalizada de Vim (Vi Improved 9.1 Normal version without GUI) para Linux ya testeado en todos los sistemas operativos de los ordenadores de prácticas de la ETSIIT UGR excepto Ubuntu 18.
Es decir, funciona en Kubuntu y Ubuntu 20.04, 22.04 y 24.04.

Contamina el $HOME. Asume uso de bash.

Uso:
1. Clonar los archivos del repositorio (o usar .vimrc propio) y ejecutar el script ugr_vim_setup_lite.sh con un argumento: el nombre del USB (o directorio) donde estén guardados el .vimrc y vim.tgz
2. Ejecutar `source .bashrc`

Importante: quedan switcheados la tecla Ctrl y Caps-Lock. Si no se desesa este efecto, comentar la última parte del script.
