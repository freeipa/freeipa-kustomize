# Node overlays

At this directory you can find several overlays that helps to configure
the nodes for our investigations.

## Setting userns configuration

This will allow to set up the configuration in a cluster for using
userns by updating runc and crio and by setting the necessary
configuration into the system for our investigations.

```shell
make -C config/static/nodes/userns configure
kustomize build config/static/nodes/userns | oc create -f -
```

For removing the changes you can do:

```shell
make -C config/static/nodes/userns configure
kustomize build config/static/nodes/userns | oc delete -f -
```

> But the runc and cri-o rpm packages are not restored

This overlay include cgroup-v2, userns-subid, runc and cri-o overlays.
