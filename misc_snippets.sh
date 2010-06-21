
for foo in `cat /tmp/gibbon-slaves.log` ; do echo $foo ; sshkp $foo 'for svc in hadoop-0.20-{tasktracker,datanode} ; do tail -n100 /var/log/hadoop/hadoop-hadoop-datanode*.log ; done' & done

knife cookbook upload --all ; for foo in ~/ics/sysadmin/cluster_chef/roles/* ~/ics/sysadmin/infochimps_chef/roles/* ; do echo $foo ; knife role from file $foo ; done 


broham fuck_all_yall gibbon-slave
cloud-start -n slave -c ~/ics/sysadmin/cluster_chef/clouds/hadoop_clouds.rb 

scp -i ~/.hadoop-ec2/keypairs/gibbon.pem ~/.hadoop-ec2/{certs/cert.pem,certs/pk.pem,keypairs/gibbon.pem} ubuntu@ec2-184-73-131-24.compute-1.amazonaws.com:/tmp

. ~/.hadoop-ec2/aws_private_setup.sh ; hadoop-ec2 list gibbon > /tmp/gibbon-hosts.tsv ; cut -f4 /tmp/gibbon-hosts.tsv > /tmp/gibbon-slaves.tsv

for foo in `cat /tmp/slaves ` ; do echo $foo ; ssh -i ~/.hadoop-ec2/keypairs/gibbon.pem ubuntu@$foo 'sudo kill `ps aux | grep "/usr/bin/chef-client" | cut -c 10-15 `' & done 
