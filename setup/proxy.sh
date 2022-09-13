# add for proxy
export hostip=$(ip route | grep default | awk '{print $3}')
if test -z $(uname -a|grep wsl);then
	hostip=${hostip%.*}".1"
fi
if [ ! -f "/etc/apt/apt.conf.d/proxy.conf" ]; then
	sudo touch /etc/apt/apt.conf.d/proxy.conf
fi
export hostport=7890
export hostprotocol='socks5'
alias easyproxy='
	export https_proxy="${hostprotocol}://${hostip}:${hostport}";
	export http_proxy="${hostprotocol}://${hostip}:${hostport}";
	export HTTPS_PROXY="${hostprotocol}://${hostip}:${hostport}";
	export HTTP_PROXY="${hostprotocol}://${hostip}:${hostport}";
	export ALL_PROXY="${hostprotocol}://${hostip}:${hostport}";
'
alias easyunproxy='
	unset https_proxy;
	unset http_proxy;
	unset HTTPS_PROXY;
	unset HTTP_PROXY;
	unset ALL_PROXY;
'
alias proxy='
	export https_proxy="${hostprotocol}://${hostip}:${hostport}";
	export http_proxy="${hostprotocol}://${hostip}:${hostport}";
	export HTTPS_PROXY="${hostprotocol}://${hostip}:${hostport}";
	export HTTP_PROXY="${hostprotocol}://${hostip}:${hostport}";
	export ALL_PROXY="${hostprotocol}://${hostip}:${hostport}";

	sudo sed -i -e '/Acquire::http::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
	sudo sed -i -e '/Acquire::https::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
	echo -e "Acquire::http::Proxy \"http://${hostip}:${hostport}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;
	echo -e "Acquire::https::Proxy \"http://${hostip}:${hostport}\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null;

	sudo sed -i -e'/^https_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^http_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^ftp_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^use_proxy=on/d' /etc/wgetrc;
	sudo echo "https_proxy = http://${hostip}:${hostport}/" | sudo tee -a /etc/wgetrc > /dev/null;
	sudo echo "http_proxy = http://${hostip}:${hostport}/" | sudo tee -a /etc/wgetrc > /dev/null;
	sudo echo "ftp_proxy = http://${hostip}:${hostport}/" | sudo tee -a /etc/wgetrc > /dev/null;
	sudo echo "use_proxy=on" | sudo tee -a /etc/wgetrc > /dev/null;

	'
  # if [ "`git config --global --get proxy.https`" != "${hostprotocol}://${hostip}:${hostport}" ]; then
  #   git config --global proxy.https ${hostprotocol}://${hostip}:${hostport} 
  # fi 
  # if [ "`git config --global --get proxy.http`" != "${hostprotocol}://${hostip}:${hostport}" ]; then
  #   git config --global proxy.http ${hostprotocol}://${hostip}:${hostport} 
  # fi 

alias unproxy='
	unset https_proxy;
	unset http_proxy;
	unset HTTPS_PROXY;
	unset HTTP_PROXY;
	unset ALL_PROXY;

	sudo sed -i -e '/Acquire::http::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;
	sudo sed -i -e '/Acquire::https::Proxy/d' /etc/apt/apt.conf.d/proxy.conf;

	sudo sed -i -e'/^https_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^http_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^ftp_proxy/d' /etc/wgetrc;
	sudo sed -i -e'/^use_proxy=on/d' /etc/wgetrc;

	'
  # git config --global --unset https.proxy
  # git config --global --unset http.proxy
