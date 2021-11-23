# Prototype for getting fresh container images working

This proof of concept try to detect the necessary changes
to freeipa-openshift-container for making the fresh
container images to deploy in Openshift. The current image
comes from a prototype at `incubator/005-deploy-in-one-pod`.
This directory start as a copy of 005-deploy-in-one-pod,
and try to use a fresh image from freeipa-container to
see what we need to change for freeipa-openshift-container.

It update the configuration and clean it up for getting
the minimal that is working.

It is using ephemeral volume storage, just to detect what
we need to change for the container so that it can
start up again.


## Getting started

Just run:

```shell
export DOCKER_IMAGE_BASE=quay.io/<scope>
make container-build container-push app-create
```

> If 'freeipa' namespace exists, it fails; just be aware of
> it; you can run `make app-delete` to be sure no resources
> exists that could evoke some error when creating them.

- Where **scope** is the name of the account or organization
  where you will publish the image. It is required to be
  defined to avoid that by mistake it could be overwritten
  any image into the **freeipa** organization.

Later you only have to retrieve the list of objects:

```shell
oc get all
```

Access the route created:

```shell
xdg-open https://<route-hostname>
```

Where **route-hostname** is the hostname that appear for the
Route object created.

And finally to delete the configuration, you only have to run:

```shell
make app-delete
```

