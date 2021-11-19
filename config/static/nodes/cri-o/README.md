# Setting a custom cri-o environment

This configuration install into the pool indicated a custom cri-o version by
installing a RPM package. By default it installs the package for "worker" and
"master" nodes, but we can change that behavior.

Basic usage:

```shell
export RPM_CRI_O="https://..."
make -C config/static/nodes/cri-o configure
kustomize build config/static/nodes/cri-o | oc create -f -
```

For installing only in one specific pool:

```shell
export RPM_CRI_O="https://..."
export POOL="worker"
make -C config/static/nodes/cri-o configure
kustomize build config/static/nodes/cri-o | oc create -f -
```

> Note that if you are putting the environment variables at `private.mk` file
> into the repository base directory, you will need to export the variables
> `RPM_CRI_O` and `POOL` for letting the process aware about the values.
>
> ```Makefile
> RPM_CRI_O := https://...
> export RPM_CRI_O
> ```

