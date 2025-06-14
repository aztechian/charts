# staticsite

![Version: 2.3.0](https://img.shields.io/badge/Version-2.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.28.0](https://img.shields.io/badge/AppVersion-1.28.0-informational?style=flat-square)

A static webserver. Uses nginx with a PersistentVolume for serving content.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Ian Martin | <ian@imartin.net> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | nginx | 20.* |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| nameOverride | string | `""` |  |
| nginx.autoscaling.enabled | bool | `false` |  |
| nginx.autoscaling.maxReplicas | int | `3` |  |
| nginx.autoscaling.minReplicas | int | `1` |  |
| nginx.autoscaling.targetCPU | int | `90` |  |
| nginx.metrics.enabled | bool | `false` |  |
| nginx.metrics.resources.limits.cpu | string | `"50m"` |  |
| nginx.metrics.resources.limits.memory | string | `"64Mi"` |  |
| nginx.metrics.resources.requests.cpu | string | `"10m"` |  |
| nginx.metrics.resources.requests.memory | string | `"16Mi"` |  |
| nginx.metrics.serviceMonitor.enabled | bool | `true` |  |
| nginx.metrics.serviceMonitor.namespace | string | `"metrics"` |  |
| nginx.metrics.serviceMonitor.selector.release | string | `"prometheus"` |  |
| nginx.resources.limits.cpu | string | `"1000m"` |  |
| nginx.resources.limits.memory | string | `"256Mi"` |  |
| nginx.resources.requests.cpu | string | `"10m"` |  |
| nginx.resources.requests.memory | string | `"32Mi"` |  |
| nginx.serverBlock | string | `""` |  |
| nginx.service.externalTrafficPolicy | string | `""` |  |
| nginx.service.type | string | `"ClusterIP"` |  |
| nginx.staticSitePVC | string | `nil` |  |
| persistentVolume.accessMode | string | `"ReadOnlyMany"` |  |
| persistentVolume.size | string | `"1Gi"` |  |
| persistentVolume.storageClass | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
