# devtools
pacman -S --noconfirm nano htop git
# dependencies
pacman -S --noconfirm curl etcd cri-o

#master
pacman -S --noconfirm  kubernetes-control-plane kubectl

# worker
#pacman -S --noconfirm  kubernetes-node


systemctl enable kubelet.service crio.service
swapoff -a
# change group
echo " --cgroup-driver='systemd'" >> /etc/kubernetes/kubelet.env


# init the cluster
kubeadm init --cri-socket='unix:///run/crio/crio.sock'
# join cluster
#kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash> --node-name=<name_of_the_node> --cri-socket='unix:///run/crio/crio.sock'
