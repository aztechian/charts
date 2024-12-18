# samba

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.19](https://img.shields.io/badge/AppVersion-4.19-informational?style=flat-square)

A Helm chart for deploying ServerContainer's samba into Kubernetes.

See https://github.com/ServerContainers/samba for more information about the image and details on the configuration options.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| config.accounts | object | `{}` | Create user accounts on the container OS and Samba. Each map entry should be the name of the user as the key, and values of `password`, `uid` (optional), and `groups` (optional) |
| config.avahi.disabled | bool | `true` |  |
| config.avahi.hostname | string | `nil` |  |
| config.failFast | string | `nil` | immediately fail the container start if user/group creation fails |
| config.globalStanza | string | `""` | Set configuration values in the Global section of smb.conf |
| config.groups | object | `{}` | Create group accounts on the container OS and Samba. Each map entry should be the name of the group as the key, and the value of `gid` as the value. |
| config.logLevel | string | `"2"` | Set the log level for Samba, the default is 2 |
| config.mapToGuest | string | `nil` | Set the Map to Guest user for Samba, the default is "Bad User" |
| config.model | string | `nil` | Set the model icon for Samba in the finder, the default is "TimeCapsule" |
| config.netbios.disabled | bool | `true` |  |
| config.serverRole | string | `nil` | Set the server role for Samba, the default is "standalone" |
| config.serverString | string | `nil` | Set the server string for Samba, the default is "Samba Server" |
| config.timezone | string | `nil` | Set the timezone string for the container, the default is UTC |
| config.volumeConfigs | object | `{}` | Create volume configurations in the smb.conf. See https://github.com/ServerContainers/samba?tab=readme-ov-file#environment-variables-and-defaults for details |
| config.workgroup | string | `nil` | Set the workgroup for Samba, the default is "WORKGROUP" |
| config.wsdd2.disabled | bool | `true` |  |
| config.wsdd2.parameters | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/servercontainers/samba"` |  |
| image.tag | string | `"smbd-only-latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraHosts | list | `[]` |  |
| ingress.hostname | string | `"samba.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `445` |  |
| service.type | string | `"LoadBalancer"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
