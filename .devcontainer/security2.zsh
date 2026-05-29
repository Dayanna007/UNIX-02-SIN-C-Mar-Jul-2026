# Ver el grupo principal actual
id
# solo el nombre del grupo principa
id -gn    
# Crear un archivo y ver qué grupo hereda
touch ~/test_grupo_heredado.txt
# El grupo es el grupo principal del usuario
ls -la ~/test_grupo_heredado.txt
#
groups
# Ver el grupo actual
id -gn
echo "Grupo actual: $(id -gn)"
# Crear un archivo antes de newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt
#
groups
#
cat /etc/group | grep root
#
touch ~/despues_grupos.txt
#
ls -la ~/despues_grupos.txt
#
pwd
#
whoami
#
ls -ld /root
#
ls -ld /workspaces
#
ls -ld /workspaces/UNIX-02-SIN-C-Mar-Jul-2026
#
stat ~/test_grupo_heredado.txt
#
stat ~/antes_de_newgrp.txt
#
stat ~/despues_grupos.txt
#
chmod 600 ~/test_grupo_heredado.txt
#
ls -la ~/test_grupo_heredado.txt
#
chmod 644 ~/antes_de_newgrp.txt
#
ls -la ~/antes_de_newgrp.txt
#
chmod 777 ~/despues_grupos.txt
#
ls -la ~/despues_grupos.txt
#
stat ~/despues_grupos.txt
#
touch ~/dentro_de_newgrp.txt
#
ls -la ~/dentro_de_newgrp.txt
#
mkdir -p ~/proyecto_dev/src
#
ls -la ~/
#
echo $$
#
echo "PID del shell actual: $$"
#
newgrp desarrolladores
#
echo "PID dentro de newgrp: $$"
#
groupadd grupo_restringido
#
gpasswd grupo_restringido
#
newgrp grupo_restringido
#
echo "Grupo actual: $(id -gn)"