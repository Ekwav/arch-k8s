# devtools
pacman -S --noconfirm nano htop git
# dependencies
pacman -S --noconfirm curl #cri-o # etcd should be installed as per wiki

#master only
pacman -S --noconfirm  kubernetes-control-plane 

# worker
# pacman -S --noconfirm  kubernetes-node

# setup stuff
pacman -S --noconfirm containerd kubectl kubeadm

echo "enabling kubelet"
systemctl enable kubelet.service
systemctl start kubelet.service

echo "turning swap off"
swapoff -a
cp coflnet-start.service /lib/systemd/system/coflnet-start.service
sudo systemctl enable coflnet-start

# -> configure
cat <<EOF | tee /etc/modules-load.d/containerd.conf
br_netfilter
EOF
 modprobe br_netfilter
cat <<EOF | tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sysctl --system
systemctl start containerd
systemctl enable containerd

# change group
echo " --cgroup-driver='systemd'" >> /etc/kubernetes/kubelet.env

# reload
echo "execute start.sh after the reboot"
reboot


