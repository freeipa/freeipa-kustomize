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

However, if you are using a SNO cluster, you need to apply the configuration
to the control plane nodes (master) by:

```shell
oc create -f machine-config-cgroup-v2-master.yaml
```

