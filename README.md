# yopass-redis

## A Helm chart to deploy yopass backed by redis

## Contents

  * [Contents](#contents)
    + [architecture](#architecture)
    + [local development prerequisites](#local-development-prerequisites)
    + [local deployment](#local-deployment)
  * [Performance testing](#performance-testing)
  * [Helm Configuration](#helm-configuration)

### architecture

A [yopass](https://github.com/jhaals/yopass) password application POC backed by redis using the [community redis chart](https://bitnami.com/stack/redis/helm).

yopass is deployed as a replicaset with a minimum of two replicas capable of autoscaling to 5. communication between yopass and redis is done via a service object to keep the traffic internal to the cluster and loadbalanced.

### local development prerequisites

install [minikube](https://minikube.sigs.k8s.io/docs/start/), [helm](https://helm.sh/docs/intro/install/) and [kubectl](https://kubernetes.io/docs/tasks/tools/)
minikube requires the following addons enabled to work with this chart. You can check current addons with `minikube addons list`:

Enable the metrics server for [horizontal pod autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/) to work.
```
minikube addons enable metrics-server
```

Enable kube-dns to have cluster dns function. this should already be enabled
```
minikube addons enable kube-dns
```

Enable ingress support so we can use ingress objects locally and talk to the app on http
```
minikube addons enable ingress
```

optional:

install [k9s](https://github.com/derailed/k9s)


### local deployment

move into the helm chart directory

```
cd helm/yopass-redis/
```

Install the helm dependencies

```
helm dependency update
```

Install the helm chart for yopass-redis

```
helm install yopass -f values.yaml -f values-dev.yaml .
```

if you make changes to any of the values you may upgrade the deployment with:

```
helm upgrade yopass -f values.yaml -f values-dev.yaml .
```

To access the app locally you need ammend your /etc/hosts file with the minikube ip:

```
minikube ip
```

edit hosts file
```
vim /etc/hosts
```
add
```
<minikube-ip> yopass.radioco.local
```

now you can access yopass at  http://yopass.radioco.local

when you are ready to clean up:

```
helm uninstall yopass
```

## Performance testing

Run the [performance test script](tests/performance/http-saturate-yopass.sh). this will fire a request to the yopass app internally in the cluster from a pod to yopass service and scale the replicas to meet demand.
you can see the effect with `kubectl get hpa`. Stopping the script will eventually scale down the app.

## Helm Configuration

detailed helm configuration can be found [here](helm/yopass-redis/README.md)

## Github Workflows

 - A basic cicd workflow on pull request to check the helm chart can be found [here](.github/workflows/test-helm.yaml)
 - Template the helm chart on any push event. Issue #9
 - Autogenerate helm docs on PR/push. Issue #11