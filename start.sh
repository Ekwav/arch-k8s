# init the cluster
echo "starting kubeadm"
kubeadm init --cri-socket='unix:///run/crio/crio.sock'
# join cluster
#kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash> --node-name=<name_of_the_node> --cri-socket='unix:///run/crio/crio.so>

