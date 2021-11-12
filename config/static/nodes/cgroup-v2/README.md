# cgroup-v2

If you have your OpenShift SNO running, you will only need to
apply the configuration by:

```shell
oc create -f config/static/nodes/cgroup-v2/machine-config-cgroup-v2-master.yaml
```

For a no SNO running, you have to apply master and worker configuration by:

```shell
kustomize build config/static/nodes/machin
```
