# Setting the runc environment

This configuration install into the pool indicated a custom runc version by
installing a RPM package. By default it installs the package for "worker" and
"master" nodes, but we can change that behavior.

Basic usage:

```shell
export RPM_PACKAGES="https://..."
make -C config/static/nodes/runc configure
kustomize build config/static/nodes/runc | oc create -f -
```

For installing only in one specific pool:

```shell
export RPM_PACKAGES="https://..."
export POOL="master"
make -C config/static/nodes/runc configure
kustomize build config/static/nodes/runc | oc create -f -
```

> Note that if you are putting the environment variables at `private.mk` file
> into the repository base directory, you will need to export the variables
> `RPM_PACKAGES` and `POOL` for letting the process aware about the values.
>
> ```Makefile
> POOL ?= master
> RPM_PACKAGES ?= ...
> export RPM_PACKAGES POOL
> ```
>
> It is recommended to use `?=' operator to allow overriding the values form
> the CLI when invoking make configure

## Installing a custom rpm package for runc

The below install a custom runc package into all the nodes.

```shell
POOL="master worker" RPM_PACKAGES=https://ftweedal.fedorapeople.org/runc-1.0.0-990.rhaos4.8.gitcd80260.el8.x86_64.rpm make configure
kustomize build | oc create -f -
```

We can specify more packages just adding values to `RPM_PACKAGES` variable.

If you are using a SNO cluster by using CodeReadyContainers, you could want to
monitor the execution by:

```shell
ssh -i ~/.crc/machines/crc/id_ecdsa core@192.168.130.11 journalctl -u install-PKG_NAME.service
```

As the above is more responsive than `oc adm node-logs nodes/NODE -u install-PKG_NAME.service`.

