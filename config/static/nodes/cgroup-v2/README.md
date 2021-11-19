# cgroup-v2

This configuration will set cgroup-v2 for workers and master nodes.

```shell
make -C config/static/nodes/cgroup-v2 configure
kustomize build config/static/nodes/cgroup-v2/ | oc create -f
```

> By default it configures the configuration for worker and master nodes.

Our scenario only need cgroup-v2 on worker nodes, so it could be more
convenience to do the below:

```shell
POOL="worker" make -C config/static/nodes/cgroup-v2 configure
kustomize build config/static/nodes/cgroup-v2/ | oc create -f
```

If in the future we move the workload to the control plane, then we
could need to set master node too to use cgroup v2. If you are using a
SNO (Single Node Openshift), you will need to apply the configuration to
the master node too:

```shell
POOL="master" make -C config/static/nodes/cgroup-v2 configure
kustomize build config/static/nodes/cgroup-v2/ | oc create -f
```

