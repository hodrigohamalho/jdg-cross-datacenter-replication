export NODEID=$1
((NODEID=NODEID-1))
export IP=@@xsite.site1.ip@@
export OFFSETS=(@@xsite.site1.jdg1.offset@@ @@xsite.site1.jdg2.offset@@ @@xsite.site1.jdg3.offset@@)
export OFFSET=${OFFSETS[$NODEID]}
export EAP_HOME=@@rhq.deploy.dir@@/@@eap.folder.name@@


((MGMT_PORT = 9999 + OFFSET))
echo ">> Stopping the JDG server bound to address: $IP and at management port: $MGMT_PORT "
nc -z $IP $MGMT_PORT
if (($? == 0)); then
    $EAP_HOME/bin/jboss-cli.sh --connect --controller=$IP:$MGMT_PORT --user=@@xsite.admin.username@@ --password=@@xsite.admin.password@@ --command="shutdown"
fi
