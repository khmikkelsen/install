
# Android studio
sudo add-apt-repository -y ppa:maarten-fonville/android-studio
sudo apt -y update
sudo apt -y install android-studio
sudo apt -y install cpu-checker


egrep -c '(vmx|svm)' /proc/cpuinfo

if egrep -c '(vmx|svm)' /proc/cpuinfo | grep -q '0'; then
	echo 'no cpu accel'
else
	sudo apt-get -y install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils ia32-libs-multiarch
fi

sudo 'fs.inotify.max_user_watches = 524288' >> /etc/sysctl.d/idea.conf 
sudo sysctl -p --system
