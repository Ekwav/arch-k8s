# init the cluster
echo "starting kubeadm"
kubeadm init --pod-network-cidr=192.168.0.0/16
# join cluster
#kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash> --node-name=<name_of_the_node> --cri-socket='unix:///run/crio/crio.so>

