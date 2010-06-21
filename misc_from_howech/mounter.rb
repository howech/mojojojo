cluster =[ #%w{i-06d4cd6d ec2-184-73-242-176.compute-1.amazonaws.com vol-42d2402b },
           %w{i-7c574f17 ec2-67-202-24-205.compute-1.amazonaws.com vol-0ec65467},
           %w{i-72574f19 ec2-75-101-175-220.compute-1.amazonaws.com vol-1cc65475},
           %w{i-74574f1f ec2-174-129-101-211.compute-1.amazonaws.com vol-14c6547d},
           %w{i-4c574f27 ec2-184-73-1-16.compute-1.amazonaws.com vol-e4c6548d} ]

key = "~/.chef/certs/pk-QJ2H52LDXFT7ZYWW6AAJQB77CWRO47EI.pem"
cert = "~/.chef/certs/cert-QJ2H52LDXFT7ZYWW6AAJQB77CWRO47EI.pem"
ssh_key="~/.chef/keypairs/zaius.pem"



cluster.each do |inst,addr,vol|
 #`ec2-attach-volume -K #{key} -C #{cert} -i #{inst} -d /dev/sdh #{vol}`
 #`ssh -i #{ssh_key} ubuntu@#{addr} sudo mkdir /mnt/ebs`
 #`ssh -i #{ssh_key} ubuntu@#{addr} sudo mkfs.xfs -f /dev/sdh `
 #`ssh -i #{ssh_key} ubuntu@#{addr} sudo mount /dev/sdh /mnt/ebs`
 `scp -i #{ssh_key} move_file_system.sh ubuntu@#{addr}:/home/ubuntu/mfs.sh`
 `ssh -i #{ssh_key} ubuntu@#{addr} sudo sh /home/ubuntu/mfs.sh`
end
