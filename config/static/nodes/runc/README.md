# Setting the runc environment

This configuration install into the pool indicated a custom runc version by
installing a RPM package. By default it installs the package for "worker" and
"master" nodes, but we can change that behavior.

Basic usage:

```shell
export RPM_RUNC="https://..."
make -C config/static/nodes/runc configure
kustomize build config/static/nodes/runc | oc create -f -
```

For installing only in one specific pool:

```shell
export RPM_RUNC="https://..."
export POOL="worker"
make -C config/static/nodes/runc configure
kustomize build config/static/nodes/runc | oc create -f -
```

> Note that if you are putting the environment variables at `private.mk` file
> into the repository base directory, you will need to export the variables
> `RPM_RUNC` and `POOL` for letting the process aware about the values.
>
> ```Makefile
> RPM_RUNC := https://...
> export RPM_RUNC
> ```

