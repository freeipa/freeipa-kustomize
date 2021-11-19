# Configure userns into nodes

This configuration set up all the necessary for updating the nodes indicated
and start using userns for our investigations.

```shell
make -C config/static/nodes/userns configure
kustomizebuild build config/static/nodes/userns | oc create -f -
```

You can customize which nodes to update by:

```shell
POOL="worker" make -C config/static/nodes/userns configure
kustomizebuild build config/static/nodes/userns | oc create -f -
```

> You can put POOL variable at `private.mk` file, but do not forget to
> export the variable so that it is available when invoking other Makefile
> files:
>
> ```Makefile
> POOL ?= worker
> export POOL
> ```

By default, the configuration creates is for worker and master roles.
