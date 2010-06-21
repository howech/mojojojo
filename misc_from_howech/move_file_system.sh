for f in /etc/init.d/hadoop* ; do $f stop; done
cp -a /mnt/hadoop /mnt/ebs
rm -rf /mnt/hadoop
ln -s /mnt/ebs/hadoop /mnt/hadoop
chef-client
