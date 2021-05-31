# yopass

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 10.5.7 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app | object | `{"port":1337}` | A set of yopass app scoped values used in the deployment object |
| autoscaling | object | `{"enabled":false,"maxReplicas":5,"minReplicas":2,"targetCPUUtilizationPercentage":80}` | Simple cpu metric based autoscaling. may also use memory if targetMemoryUtilizationPercentage is defined. |
| fullnameOverride | string | `""` |  |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"jhaals/yopass"}` | defining the default yopass image using the public one in dev. Override the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"yopass.radioco.local","paths":[{"path":"/","pathType":"Prefix"}]}],"tls":[]}` | An ingress to access yopass. a cert may be passed in as a secret to enable SSL/TLS termination at the ingress. See https://kubernetes.github.io/ingress-nginx/user-guide/tls/ |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `2` | minimum replica count for yopass |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service | object | `{"port":1337,"type":"ClusterIP"}` | The default service port |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | An optional service account for the application |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)