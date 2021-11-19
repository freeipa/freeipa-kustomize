# Add userns-subid

This configuration set up additional ranges for subid and subgid
for preparing the environment to userns investigations, and cri-o
configuration.

For creating the configuration do:

```shell
make -C ./config/static/nodes/userns-subid configure
kustomize build config/static/nodes/userns-subid | oc create -f -
```
