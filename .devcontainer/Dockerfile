# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# MY EXPLANATION OF BLOCK 1 — Base image
# ----------------------------------------------------------------------------
# FROM is the very first instruction in any Dockerfile. It tells Docker
# "start from this existing image instead of building from zero".
# We use Kali Linux because it is a Linux distribution made for security
# and hacking practice — it already has many useful tools included.
# The word "rolling" means it is always being updated with new versions.
# (BHB Ch.3 explains that Kali is the recommended OS for the hacking lab)
# ============================================================================
# MY EXPLANATION OF BLOCK 2 - Layers and cache
# ============================================================================
# Each instruction in this file creates a new "layer" on top of the
# previous one, like stacking pancakes.
# Docker saves (caches) each layer. If nothing changed in a line,
# Docker reuses the saved layer and skips rebuilding it — this saves time.
# That is why we put things that change rarely (like FROM and ENV) at the
# top, and things that change often at the bottom.
# ============================================================================

# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
FROM kalilinux/kali-rolling:latest


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# MY EXPLANATION OF BLOCK 3:
# ENV sets global settings that any program inside the container can read.
# Think of them as global sticky notes that the system always has available.
# (BHB Ch.1: the shell loads environment variables at the start of every session)
#
# DEBIAN_FRONTEND=noninteractive — tells apt "do not ask me questions,
#   just install everything automatically". Without this the build would
#   freeze waiting for someone to press a key.
# LANG and LC_ALL=es_ES.UTF-8 — set the language to Spanish with UTF-8
#   encoding so accents and special characters display correctly.
# TERM=xterm-256color — tells programs the terminal supports 256 colors.
#
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# MY EXPLANATION OF BLOCK 4:
# When Wireshark installs, it asks if non-root users can capture packets.
# Since we are always root inside this container we do not need that.
# If we do not answer in advance, the build will pause and wait forever.
# debconf-set-selections lets us answer that question before it is asked,
# so the installation runs without stopping.
#
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# # MY EXPLANATION OF BLOCK 5
# This is the main installation block. Here is what each part does:
#
# apt-get update — refreshes the list of available packages from the
#   internet so we get the latest versions. Always run before installing.
#   (BHB Ch.3 shows this same pattern when setting up the Kali lab)
# apt-get install — downloads and installs all the packages we list.
#   -y means "yes to everything, do not ask me to confirm".
#   --no-install-recommends means "only install what is strictly needed,
#   skip optional extras" — this keeps the image smaller.
#
# Why one big RUN instead of many small ones?
#   Each RUN creates a new layer. More layers = bigger image. Combining
#   everything in one RUN keeps the final image as small as possible.
#
# && chains commands: the next one only runs if the previous one worked.
#   If something fails the build stops with a clear error.
# \ at the end of a line means "this command continues on the next line".
#
# Some important tools:
#   gawk / sed / grep  — text processing tools covered in BHB Ch.2
#   shellcheck         — checks bash scripts for errors automatically
#   nmap               — famous network port scanner (BHB Ch.4)
#   tcpdump / tshark   — capture and read network traffic
#   tor / proxychains4 — route traffic anonymously through Tor network
#   jq                 — parse and filter JSON from the command line
#   man-db             — installs manual pages so "man grep" works
#
#Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # MY EXPLANATION OF BLOCK F:
 # sed finds the line "# es_ES.UTF-8" in the locale.gen file and removes
 # the # symbol to enable that language. Then locale-gen compiles the
 # locale files so the system can display Spanish characters correctly.
 # sed is a stream editor that modifies text in files without opening them.
 # (BHB Ch.2 covers sed as one of the main text processing tools)
 #
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # MY EXPLANATION OF BLOCK 6:
 # After installing, apt leaves cached files we no longer need.
 # We delete them here in the SAME RUN block on purpose — if we used a
 # separate RUN, Docker would save the cache in the previous layer anyway
 # and the image would not actually get smaller.
 # apt-get clean removes downloaded .deb package files.
 # rm -rf /var/lib/apt/lists/* removes the package index files.
 #
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# MY EXPLANATION OF BLOCK 7:
# By default Docker runs RUN instructions using /bin/sh, which is a basic
# and limited shell. We switch to /bin/bash so future RUN steps can use
# modern bash features like arrays and [[ ]] conditions.
# (BHB Ch.1 explains that bash is a more powerful superset of basic sh)
#
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# MY EXPLANATION OF BLOCK 8:
# WORKDIR sets the default folder you land in when you open a terminal
# inside the container — like doing "cd /workspaces" automatically.
# Codespaces always mounts the repository under /workspaces/ so this
# puts us right next to our course files from the start.
#
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# MY EXPLANATION OF BLOCK 9:
# These lines configure Git for all users inside the container.
# safe.directory '*' — trusts any repo folder even if the owner does not
#   match the current user. Needed because Codespaces mounts files with
#   a different user ID than root inside the container.
# init.defaultBranch main — makes "main" the default branch on git init
#   instead of the old default "master".
# pull.rebase false — when we do git pull, Git will merge new commits
#   instead of rebasing — easier to understand for beginners.
# git lfs install --system — registers Git LFS hooks globally so any
#   repo that needs large file storage works without extra setup.
#
# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.

# MY EXPLANATION OF BLOCK 10:
# chsh -s changes the login shell for a user.
# Here we change root's default shell from bash to zsh.
# Zsh is a more modern shell with better autocomplete and a nicer prompt.
# (BHB Ch.3 mentions that Kali uses zsh as its default shell)
#
#Cambiar shell de login de root a zsh dentro de la imagen,
#para que chsh ya no haga falta y todo sea consistente.
RUN chsh -s /usr/bin/zsh root

# MY EXPLANATION OF BLOCK 11:
# A heredoc (here document) is a way to write multiple lines of text
# directly inside a script without creating a separate file.
# The syntax << 'EOF' ... EOF treats everything between the markers as
# input to the command — in this case cat >> appends it to .zshrc.
# (BHB Ch.1 explains heredocs as a redirection operator using <<)
#
# .zshrc is the config file zsh reads every time a new terminal opens.
# The PROMPT line sets a custom prompt that shows the student name,
# current folder, and a green "ok" or red "bad" depending on whether
# the last command succeeded or failed.
#
# Prompt institucional para los y las estudiantes del curso
RUN cat >> /root/.zshrc <<'EOF'

# ----- Valida si un comando fue ejecutado correctamente -----
PROMPT='%F{cyan}[Dayanna-Gaguancela]%f %F{yellow}%~%f %(?.%F{green}ok.%f.%F{red}bad %?%f) %# '

# ===== Prompt del curso =====
__set_prompt() {
    local ec=$?
    local mark
    if [ $ec -eq 0 ]; then
        mark='\[\e[32m\]✓\[\e[0m\]'
    else
        mark="\[\e[31m\]✗ $ec\[\e[0m\]"
    fi
    PS1="\[\e[36m\][Dayanna-Gaguancela]\[\e[0m\] \[\e[33m\]\W\[\e[0m\] $mark \$ "
}
PROMPT_COMMAND=__set_prompt
EOF

#MY EXPLANATION OF BLOCK 12
# CMD defines what runs automatically when the container starts.
# The difference between CMD and RUN:
#   RUN executes during the BUILD of the image (to install things).
#   CMD executes when the container STARTS (to give you a shell).
# /bin/bash opens an interactive terminal by default.
# Codespaces overrides this with its own VS Code terminal, but it is
# good practice to always define a CMD so the image works with plain Docker too.
CMD ["/bin/bash"]




