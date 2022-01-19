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

> You can put `POOL` and `RPM_PACKAGES` variables at `private.mk` file, but do
> not forget to export the variable so that it is available when invoking other
> Makefile files:
>
> ```Makefile
> POOL ?= master
> RPM_PACKAGES ?= https://ftweedal.fedorapeople.org/runc-1.0.0-990.rhaos4.8.gitcd80260.el8.x86_64.rpm make configure
> export POOL RPM_PACKAGES
> ```

By default, the configuration creates it for worker and master roles.

## References

- Fraser's blog: [Demo: namespaced systemd workloads on OpenShift](https://frasertweedale.github.io/blog-redhat/posts/2021-07-22-openshift-systemd-workload-demo.html).
