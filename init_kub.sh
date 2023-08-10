#!/bin/bash

${PWD}/virtual_interface.sh veth0;
swapoff -a && echo swap disabled;
export KUBECONFIG=$HOME/.kube/config && echo 'kubeconfig initialized';
sudo systemctl start docker.service && echo Docker started;
systemctl stop haproxy.service && echo HAproxy stopped;
# sudo systemctl start haproxy.service && echo HAproxy load balancer started;
systemctl start kubelet.service && echo Kubelet service started;
su root --command "export KUBECONFIG=/etc/kubernetes/admin.conf";
exit 0;
