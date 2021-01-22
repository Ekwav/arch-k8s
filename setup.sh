# devtools
pacman -S --noconfirm nano htop git
# dependencies
pacman -S --noconfirm curl cri-o # etcd should be installed as per wiki

#master
pacman -S --noconfirm  kubernetes-control-plane 

# worker
#pacman -S --noconfirm  kubernetes-node

# setup stuff
pacman -S --noconfirm kubectl kubeadm

echo "enabling kubelet"
systemctl enable kubelet.service crio.service
systemctl start kubelet.service crio.service

echo "turning swap off"
swapoff -a
cp coflnet-start.service /lib/systemd/system/coflnet-start.service
sudo systemctl enable coflnet-start


# change group
echo " --cgroup-driver='systemd'" >> /etc/kubernetes/kubelet.env

# reload
echo "execute start.sh after the reboot"
reboot


