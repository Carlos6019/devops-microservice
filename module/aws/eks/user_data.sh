#!/bin/bash
set -o xtrace

# Install required packages
yum install -y amazon-efs-utils

# Configure kubelet
/etc/eks/bootstrap.sh ${cluster_name} \
  --kubelet-extra-args '--node-labels=eks.amazonaws.com/nodegroup=main,eks.amazonaws.com/nodegroup-image=ami-0123456789,eks.amazonaws.com/capacityType=ON_DEMAND' \
  --apiserver-endpoint ${cluster_endpoint} \
  --b64-cluster-ca ${cluster_certificate_authority_data} 