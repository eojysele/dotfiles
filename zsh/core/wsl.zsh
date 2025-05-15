export WSL_HOST=$(ip route | grep default | awk '{print $3}')

if nc -z -w 1 $WSL_HOST 10808 >/dev/null 2>&1; then
  export http_proxy="http://$WSL_HOST:10808"
  export https_proxy="http://$WSL_HOST:10808"
  export no_proxy="localhost,127.0.0.1,::1"
else
  unset http_proxy
  unset https_proxy
  unset no_proxy
fi

