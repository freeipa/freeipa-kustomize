# cgroup-v2

This configuration will set cgroup-v2 for workers and master nodes.

```shell
kustomize build config/static/nodes/cgroup-v2/ | oc create -f
```

Our scenario only need cgroup-v2 on worker nodes, so it could be more
convenience to do the below:

```shell
oc create -f machine-config-cgroup-v2-worker.yaml
```

If in the future we move the workload to the control plane, then we
could need to set master node too to use cgroup v2. If you are using a
SNO (Single Node Openshift), you will need to apply the configuration to
the master node too:

```shell
oc create -f machine-config-cgroup-v2-master.yaml
```

