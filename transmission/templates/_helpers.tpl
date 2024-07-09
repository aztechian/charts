{{/*
Expand the name of the chart.
*/}}
{{- define "transmission.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "transmission.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "transmission.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "transmission.labels" -}}
helm.sh/chart: {{ include "transmission.chart" . }}
{{ include "transmission.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "transmission.selectorLabels" -}}
app.kubernetes.io/name: {{ include "transmission.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "transmission.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "transmission.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Determine the effective user ID of the container
*/}}
{{- define "transmission.effectiveUID" -}}
{{- if .Values.uid }}
{{- printf "%d" .Values.uid }}
{{- else }}
{{- printf "%d" 911 }}
{{- end }}
{{- end }}

{{/*
Determine the effective group ID of the container
*/}}
{{- define "transmission.effectiveGID" -}}
{{- if .Values.gid }}
{{- printf "%d" .Values.gid }}
{{- else }}
{{- printf "%d" 911 }}
{{- end }}
{{- end }}

{{/*
Common bits of VPN container configuration
*/}}
{{- define "transmission.vpn.common" -}}
securityContext:
  privileged: true
  capabilities:
    add:
      - NET_ADMIN
      - SYS_MODULE
resources:
  limits:
    cpu: 500m
    memory: 500M
  requests:
    cpu: 100m
    memory: 100M
{{- end }}

{{/*
VPN container liveness probe. Takes device name as parameter
*/}}
{{- define "transmission.vpn.livenessprobe" -}}
livenessProbe:
  exec:
    command:
      - ip
      - -br
      - a
      - show
      - {{ include "transmission.vpn.connectionName" . }}
  initialDelaySeconds: 15
  periodSeconds: 30
  timeoutSeconds: 5
{{- end }}

{{/* 
Connection name string. Uses the value if it has been provided by the user, otherwise determined from the VPN type.
wireguard is "wg0"
and openvpn is "tun0"
*/}}
{{- define "transmission.vpn.connectionName" -}}
{{- if .Values.vpn.connectionName }}
{{ .Values.vpn.connectionName }}
{{- else if (eq .Values.vpn.type "openvpn") }}
{{- print "tun0" }}
{{- else }}
{{- print "wg0" }}
{{- end }}
{{- end -}}
