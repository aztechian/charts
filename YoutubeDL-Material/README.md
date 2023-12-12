# youtubedl-material

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.3.2](https://img.shields.io/badge/AppVersion-4.3.2-informational?style=flat-square)

## Note:

> This Chart is a re-hosting of the official YoutubeDL-Material repository
Since the [YoutubeDL-Material](https://github.com/Tzahi12345/YoutubeDL-Material) doesn't have a way to directly
use their helm chart (ie, its not in a helm repository), this version is an unmodified copy of that chart
but ends up being published to https://repos.imartin.io/charts for ease-of-use.

A Helm chart for https://github.com/Tzahi12345/YoutubeDL-Material

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"tzahi12345/youtubedl-material"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.appdata.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.appdata.enabled | bool | `true` |  |
| persistence.appdata.size | string | `"1Gi"` |  |
| persistence.audio.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.audio.enabled | bool | `true` |  |
| persistence.audio.size | string | `"50Gi"` |  |
| persistence.subscriptions.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.subscriptions.enabled | bool | `true` |  |
| persistence.subscriptions.size | string | `"50Gi"` |  |
| persistence.users.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.users.enabled | bool | `true` |  |
| persistence.users.size | string | `"50Gi"` |  |
| persistence.video.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.video.enabled | bool | `true` |  |
| persistence.video.size | string | `"50Gi"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `17442` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |