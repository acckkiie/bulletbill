# lang
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8

# gnu
export LDFLAGS="-L/usr/local/opt/readline/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/readline/include:$CPPFLAGS"
export LDFLAGS="-L/usr/local/opt/gettext/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/gettext/include:$CPPFLAGS"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# openssl
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# sbin
export PATH="/usr/local/sbin:$PATH"
