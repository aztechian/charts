{{/*
Expand the name of the chart.
*/}}
{{- define "tdarr.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tdarr.fullname" -}}
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
{{- define "tdarr.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tdarr.labels" -}}
helm.sh/chart: {{ include "tdarr.chart" . }}
{{ include "tdarr.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tdarr.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tdarr.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Tdarr Pro licence key value set directly. `server.apiKey` is the deprecated name for this value.
*/}}
{{- define "tdarr.proKey.value" -}}
{{- $legacy := .Values.server.apiKey | default "" -}}
{{- .Values.server.proLicenseKey.value | default $legacy -}}
{{- end }}

{{/*
Renders "true" if a Tdarr Pro licence key is configured (directly or via an existing Secret)
*/}}
{{- define "tdarr.proKey.enabled" -}}
{{- if or .Values.server.proLicenseKey.existingSecret (include "tdarr.proKey.value" .) -}}true{{- end -}}
{{- end }}

{{/*
Renders "true" if a shared node API key is configured (directly or via an existing Secret)
*/}}
{{- define "tdarr.nodeKey.enabled" -}}
{{- if or .Values.server.nodeApiKey.existingSecret .Values.server.nodeApiKey.value -}}true{{- end -}}
{{- end }}

{{/*
Name of the Secret created by this chart to hold directly-set keys
*/}}
{{- define "tdarr.keysSecretName" -}}
{{- printf "%s-keys" (include "tdarr.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Renders "true" if this chart needs to create a Secret for directly-set keys
*/}}
{{- define "tdarr.keysSecret.enabled" -}}
{{- if or (and (include "tdarr.proKey.value" .) (not .Values.server.proLicenseKey.existingSecret)) (and .Values.server.nodeApiKey.value (not .Values.server.nodeApiKey.existingSecret)) -}}true{{- end -}}
{{- end }}

{{/*
Secret reference (name/key) for the Tdarr Pro licence key
*/}}
{{- define "tdarr.proKey.secretRef" -}}
{{- if .Values.server.proLicenseKey.existingSecret -}}
name: {{ .Values.server.proLicenseKey.existingSecret }}
key: {{ .Values.server.proLicenseKey.existingSecretKey }}
{{- else -}}
name: {{ include "tdarr.keysSecretName" . }}
key: proLicenseKey
{{- end }}
{{- end }}

{{/*
Secret reference (name/key) for the shared node API key
*/}}
{{- define "tdarr.nodeKey.secretRef" -}}
{{- if .Values.server.nodeApiKey.existingSecret -}}
name: {{ .Values.server.nodeApiKey.existingSecret }}
key: {{ .Values.server.nodeApiKey.existingSecretKey }}
{{- else -}}
name: {{ include "tdarr.keysSecretName" . }}
key: nodeApiKey
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "tdarr.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tdarr.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
