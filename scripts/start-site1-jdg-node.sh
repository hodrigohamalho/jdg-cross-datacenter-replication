export NODEID=$1
export IP=@@xsite.site1.ip@@
export DG_HOME=@@rhq.deploy.dir@@/@@jdg.folder.name@@

echo ">> Starting JBoss Data Grid Node $i in Site 1"     

if [ "udp" == "@@jgroups.stack@@" ]; then
    screen -d -m $DG_HOME/bin/clustered.sh -c jdg-site-1.xml -P @@rhq.deploy.dir@@/properties/site1-jdg$NODEID.properties -u 239.1.1.1 
else
    screen -d -m $DG_HOME/bin/clustered.sh -c jdg-site-1-tcp.xml -P @@rhq.deploy.dir@@/properties/site1-jdg$NODEID.properties  
fi
