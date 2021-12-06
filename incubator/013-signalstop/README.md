# Overview

This directory investigate the SIGSTOP instruction at Dockerfiles in Kubernetes 
by creating a kind cluster using docker or podman, and deploying the demo container
quay.io/avisied0/demos:signals

This will arise if there are any difference between Openshift which is using cri-o
or kubernetes using podman or docker as container engineers. In this particular lines
it has been used `podman` 3.4.2 on Fedora 35.

# Getting started

Set the container registry scope by:

```shell
export IMG_BASE=quay.io/USER
```

Get some help anytime by:

```shell
make help
```

Check dependencies by:

```shell
make check-deps
```

Once dependencies are accomplished just do:

```shell
make kind-create
make container-build
make container-push
```

Now we run the proof of concept by:

```shell
make create
export KUBECONFIG=$PWD/kubeconfig
kubectl wait --for=condition=Ready pod/demo-signals
kubectl logs pod/demo-signals -f &
kubectl delete pod/demo-signals
```

For podman v3.4.2 it is got the below output:

```raw
kubectl delete pod/demo-signals
pod "demo-signals" deleted
Exiting by SIGINT
```

For releasing the resources, we delete the cluster created with kind by:

```shell
make kind-delete
```

# Results

We can see that kubernetes using podman is behaving as expected, by
passing through the SIGSTOP instructions, and sending the SIGSTOP signal
indicated into the Dockerfile, so that Openshift which is using cri-o
and runc under the hood is not passing through the SIGSTOP instruction
and it is always sending SIGTERM.

# Wrap up

- `kind` using podman is passing through the information at SIGSTOP instruction
  as expecting.

# Knowledgements

Thanks to Fraser Tweedel who pushed me on this to dig more, you inspire me
and make me to go beyond my starting thoughts.

# References

- https://avisiedo.github.io/docs/stopping-systemd-workloads-in-openshift.html#stopping-systemd-workloads-in-openshift

- https://kubectl.docs.kubernetes.io/installation/kustomize/source/
- https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
- https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-source
- https://kind.sigs.k8s.io/docs/user/rootless/
