# tdarr

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.16.01](https://img.shields.io/badge/AppVersion-2.16.01-informational?style=flat-square)

Deploy Tdarr (https://home.tdarr.io) distributed transcoding in your Kubernetes cluster

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Ian Martin | <ian@imartin.net> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| extraClaims | list | `[]` | used for creating additional PVCs on the server template to mount on the server and all nodes Required fields for each element are: `name`. Optional fields  are `size`, `storageClass`, `selector`, `annotations`, `mount`, `subPath`, `readOnly` |
| extraVolumes | list | `[]` | used for mounting additional volumes that already exist to the server and all nodes Required fields for each element are: `name`. Optional fields are: `mount`, `claimName`, `subPath`, `readOnly`  |
| image.repository | string | `"ghcr.io/haveagitgat/tdarr"` |  |
| image.tag | string | the value from Chart.appVersion | the image tag value |
| ingress | object | `{"annotations":{},"enabled":false,"extraHosts":[],"hostname":"tdarr.local","labels":{},"path":"/","pathType":"ImplementationSpecific","tls":[]}` | Ingress configuration to the Tdarr Server. |
| ingress.enabled | bool | `false` | Turn on Ingress creation. |
| ingress.extraHosts | list | `[]` | Add additional host/path entries beyond the default value here. Required fields are: `name`. Optional fields are `path`, `pathType`. |
| ingress.hostname | string | `"tdarr.local"` | The primary DNS hostname to route to Tdarr Server |
| library | object | `{"enabled":false,"existingClaim":"","readOnly":false,"subPath":"","volume":{"annotations":{},"selector":{},"size":"1Gi","storageClass":""}}` | Use a persistent volume for a Library source in Tdarr. This must still be configured within the Tdarr application once it is running. |
| library.enabled | bool | `false` uses an `EmptyDir` mount that will be destroyed on pod termination. | Enable the creation of a "Library" PV/PVC for Tdarr. This will also be mounted to all node pods. |
| library.existingClaim | string | `""` | The name of an existing PVC to use for a Library source. The PVC must be in the same namespace as Tdarr. |
| library.readOnly | bool | `false` | Mount the library PVC as "readonly". Not applicable for an EmptyDir |
| library.subPath | string | `""` | Mount a subpath of the PVC. (example: "downloads/complete") |
| library.volume | object | `{"annotations":{},"selector":{},"size":"1Gi","storageClass":""}` | library volume creation information. `library.enabled` must be `true` for this to take effect. |
| node.affinity | object | `{}` |  |
| node.ccextractorPath | string | `""` |  |
| node.cronPluginUpdate | string | `""` |  |
| node.enabled | bool | `false` | Enable running Tdarr Nodes as a daemonset across the cluster. |
| node.ffmpegPath | string | `""` |  |
| node.ffmpegVersion | int | `6` |  |
| node.handbrakePath | string | `""` |  |
| node.image.repository | string | `"ghcr.io/haveagitgat/tdarr_node"` |  |
| node.image.tag | string | `""` |  |
| node.logLevel | string | reuse the log level given to the server process (default `info`) | the Tdarr node log level for nodes |
| node.mkvpropeditPath | string | `""` |  |
| node.nodeSelector | object | `{}` |  |
| node.openBrowser | bool | `true` |  |
| node.pgid | int | reuse the PGID given to the server process (default `1000`) | the Process Group ID to use for running Tdarr on the node. |
| node.port | int | `8268` |  |
| node.puid | int | reuse the PUID given to the server process (default `1000`) | the Process User ID to use for running Tdarr on the node. |
| node.resources | object | `{}` | you likely don't want a resources definition on the nodes, that way it will use anything available, but will also be the first to be evicted if there is a resource crunch. This is the `BestEffort` QoS class, and it is set for containers with undefined resources. |
| node.tolerations | list | `[]` |  |
| node.umask | string | reuse the PUID given to the server process (default `002`) | the umask to use for running Tdarr on the node. |
| server.apiKey | string | `""` | If using Tdarr Pro, your API Key. |
| server.ccextractorPath | string | `""` |  |
| server.cronPluginUpdate | string | `""` |  |
| server.ffmpegPath | string | `""` | Specify the path to a custom ffmpeg executable to use. |
| server.ffmpegVersion | int | `6` | Override a specific version of ffmpeg used for transcode. |
| server.handbrakePath | string | `""` |  |
| server.intel | bool | `true` | set environment variabels that tell Tdarr to use Intel GPU hardware for transcodes. |
| server.logLevel | string | `"info"` | Set the logging level of the Tdarr server (also used as the default value for nodes). |
| server.mkvpropeditPath | string | `""` |  |
| server.nvidia | bool | `true` | Set environment variables that tell Tdarr to use NVIDIA hardware for transcodes. |
| server.openBrowser | bool | `true` |  |
| server.persistence | object | `{"annotations":{},"enabled":true,"existingClaim":"","size":"1Gi","storageClass":"","subPath":""}` | Configure persistence for the Tdarr server. Note, this is the server configuration only If you want additional persistence for libraries, outputs, etc see `library` and `extraVolumes`/`extraClaims` |
| server.pgid | int | `1000` | A Group ID for the Tdarr process to run as. |
| server.puid | int | `1000` | A User ID for the Tdarr process to run as. Note, that the default docker image must initially start as root(0) and then switches to this UID/GID. So the pod must still run as root, although in reality this security risk is only in place for a moment during startup. |
| server.resources | object | `{"limits":{"cpu":"1000m","memory":"1Gi"},"requests":{"cpu":"100m","memory":"256Mi"}}` | Resource requests and limits for the Tdarr Server |
| server.timezone | string | `"Europe/London"` | The timezone used by the server process. Will be used for all nodes as well. |
| server.umask | string | `"002"` | A umask value for files that are created by Tdarr. |
| service.annotations | object | `{}` |  |
| service.clusterIP | string | `"None"` |  |
| service.externalTrafficPolicy | string | `"Cluster"` |  |
| service.labels | object | `{}` |  |
| service.loadBalancerIP | string | `""` |  |
| service.loadBalancerSourceRanges | list | `[]` |  |
| service.serverPort | int | `8266` |  |
| service.type | string | `"ClusterIP"` |  |
| service.webPort | int | `8265` |  |
| serviceAccount | object | `{"annotations":{},"create":false,"labels":{},"name":""}` | Use a ServiceAccount to run the Tdarr Server with |
| serviceAccount.create | bool | `false` | Turn on ServiceAccount creation and usage. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
