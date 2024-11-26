# http-echo

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 35](https://img.shields.io/badge/AppVersion-35-informational?style=flat-square)

Deploy mendhak/http-https-echo on kubernetes. This is a simple http server that echoes the request headers and body back to the client.
It is very useful for testing and debugging webhooks, and Ingress configurations.

Please see [mendhak/http-https-echo](https://github.com/mendhak/docker-http-https-echo) for more information, and how to use options available in this chart.
As of now, all options described in the source project are available in this chart.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| aztechian | <ian@imartin.net> | <https://github.com/aztechian> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `4` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cors | object | `{"credentials":null,"headers":null,"methods":null,"origin":null}` | Enable CORS headers in response to all requests. |
| cors.credentials | string | `nil` | Allow credentials in the response. Be sure to set `origin` to a specific value if you use this setting. |
| cors.headers | string | `nil` | The headers to allow. Use * to allow all. Be sure to set `origin` to a specific value if you use this setting. |
| cors.methods | string | `nil` | The methods to allow. Use * to allow all. Be sure to set `origin` to a specific value if you use this setting. |
| cors.origin | string | `nil` | The origin to allow. Use * to allow all. Without this value no other CORS values will be used. |
| disableRequestLogs | bool | `false` | Disable ExpressJS request logs in the container stdout output. |
| echoBackToClient | bool | `true` | Disable the JSON output in the response |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/mendhak/http-https-echo"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| includeEnv | bool | `false` | Return the values of all environment variables in the response to the client. |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.extraHosts | list | `[]` |  |
| ingress.extraTls | list | `[]` |  |
| ingress.hostname | string | `""` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls.enabled | bool | `false` |  |
| ingress.tls.secretName | string | `""` |  |
| jwtHeader | string | `nil` | Use the value of this header as the JWT token to decode and return in the response. |
| livenessProbe.httpGet.path | string | `"/healthz"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| logIgnorePath | string | `"/healthz"` | Don't log requests to this path. `/healthz` is the default because it matches the liveness and readiness probes. This excludes showing the kube-probe health check in the logs. |
| logWithoutNewline | bool | `false` | Turn off the newline at the end of the log output. |
| metrics | object | `{"enabled":false,"metricType":"summary","path":null,"serviceMonitor":{"additionalLabels":{},"enabled":true},"withMethod":true,"withPath":false,"withStatus":true}` | Use Prometheus metrics to gather information from the http-echo server. |
| metrics.metricType | string | `"summary"` | The type of metrics to expose, can be "summary" or "histogram" |
| metrics.path | string | `nil` | The path to expose the metrics on for scraping, default is /metrics |
| metrics.serviceMonitor.enabled | bool | `true` | Should a ServiceMonitor be created. The prometheus CRDs must be present on the cluster for this to work. |
| metrics.withMethod | bool | `true` | Partition the metrics by method |
| metrics.withPath | bool | `false` | Partition the metrics by path |
| metrics.withStatus | bool | `true` | Partition the metrics by status code |
| mtls | bool | `false` | Return mTLS certificate information from the request. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| overrideResponse | string | `""` | The HTTP response content that will is forcably returned to the client. |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| preserveHeaderCase | bool | `false` | Preserve the case of headers in the response. |
| readinessProbe.httpGet.path | string | `"/healthz"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| tls | object | `{"cert":"","key":"","secret":{"cert":"tls.crt","privateKey":"tls.key","reference":""}}` | Enable TLS termination on the pod. You would normally only use this if you are not using an Ingress. If you have an existing certificate/key in a secret, you can reference it here. |
| tls.cert | string | `""` | The certificate/full chain content to be used for TLS termination. |
| tls.key | string | `""` | The private key content to be used for TLS termination. |
| tls.secret | object | `{"cert":"tls.crt","privateKey":"tls.key","reference":""}` | Use an existing secret for the certificate and key content |
| tls.secret.cert | string | `"tls.crt"` | The data in the secret that contains the certificate. Include the full chain here if desired. |
| tls.secret.privateKey | string | `"tls.key"` | The data in the secret that contains the private key. |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
