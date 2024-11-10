nstall Docker CE on RHEL 7 #
###############################

mount -o loop /dev/sr0  /root/testing/

# Install required packages.
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# Install container-selinux. 
# Check for latest version: http://mirror.centos.org/centos/7/extras/x86_64/Packages/.
sudo yum install -y \
  http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-3.el7.noarch.rpm
yum -y  install http://mirror.centos.org/centos/7/extras/x86_64/Packages/slirp4netns-0.4.3-4.el7_8.x86_64.rpm  
yum -y install http://mirror.centos.org/centos/7/extras/x86_64/Packages/fuse-overlayfs-0.7.2-6.el7_8.x86_64.rpm
# Set up Docker repository.
sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE and tools.
sudo yum install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io
  
# Add current user to `docker` group.
sudo usermod -a -G docker $USER

# Start and enable `docker` service.
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
  
