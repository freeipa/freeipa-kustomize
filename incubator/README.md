# Incubators

This directory contain proof of concepts with the intention of research and
development so that new infrastructure combinations can be tried before to
move the configuration to an operator or static configuration helpful for
different scenarios.

Contents:

- **[001-enable-container-manage-cgroup-sebool](001-enable-container-manage-cgroup-sebool/README.md)**:
  Provide the MachineConfig object which enable the container_manage_cgroup
  sebool.
- **[002-init-container](002-init-container/README.md)**: Several
  configurations about init-containers.
- **[003-scc-and-caps](003-scc-and-caps/README.md)**: Security Container Constraints and capabilities.
- **[005-deploy-in-one-pod](005-deploy-in-one-pod/README.md)**:
  Proof of concept which deploy a Pod with Freeipa and expose the web interface.
- **[013-signalstop](013-signalstop/README.md)**:
  Proof of concept for testing SIGSTOP instruction by using `kind` and `podman` (or `docker`),
  to check if the STOPSIGNAL instruction is propagated as expected. This complete the
  blog article at [Stopping systemd workloads in Openshift](https://avisiedo.github.io/docs/stopping-systemd-workloads-in-openshift.html#stopping-systemd-workloads-in-openshift).
