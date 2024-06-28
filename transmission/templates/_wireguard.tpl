{{/*
Create a wireguard container snippet
*/}}
{{- define "transmission.wireguard.container" -}}
- name: wireguard
  image: {{ .Values.vpn.image.wireguard.repository }}:{{ .Values.vpn.image.wireguard.tag | default "latest" }}
  imagePullPolicy: {{ .Values.vpn.image.pullPolicy | default .Values.image.pullPolicy }}
  {{- include "transmission.vpn.livenessprobe" (.Values.vpn.connectionName | default "wg0") | nindent 2 }}
  {{- include "transmission.vpn.common" . | nindent 2 }}
  volumeMounts:
    - name: vpnconf
      mountPath: /config/wg_confs
{{- end -}}


{{/*
Metrics container for wireguard.
*/}}
{{- define "transmission.wireguard.metrics" }}
- name: vpn-metrics
  image: mindflavor/prometheus-wireguard-exporter:latest
  ports:
    - name: metrics
      containerPort: 9586
  args:
    - -a
    - "true"
  securityContext:
    privileged: true
    capabilities:
      add:
        - NET_ADMIN
{{- end }}
