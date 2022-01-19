# Add userns-subid

This configuration set up additional ranges for subid and subgid
for preparing the environment to userns investigations, and cri-o
configuration.

For creating the configuration do:

```shell
make -C ./config/static/nodes/userns-subid configure
kustomize build config/static/nodes/userns-subid | oc create -f -
```

## References

- Fraser's blog: [Demo: namespaced systemd workloads on OpenShift](https://frasertweedale.github.io/blog-redhat/posts/2021-07-22-openshift-systemd-workload-demo.html).
