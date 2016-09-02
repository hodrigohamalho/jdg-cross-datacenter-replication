export IP=@@xsite.site1.ip@@
export OFFSET=@@xsite.site1.eap.offset@@
export EAP_HOME=@@rhq.deploy.dir@@/@@eap.folder.name@@

((MGMT_PORT = 9999 + OFFSET))

echo ">> Stopping the EAP server bound to address: $IP and at management port: $MGMT_PORT "

nc -z $IP $MGMT_PORT
if (($? == 0)); then
    $EAP_HOME/bin/jboss-cli.sh --connect --controller=$IP:$MGMT_PORT --user=@@xsite.admin.username@@ --password=@@xsite.admin.password@@ --command="shutdown"
fi
