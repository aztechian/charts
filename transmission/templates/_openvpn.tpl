{{/*
Define an openvpn container template
*/}}
{{- define "transmission.openvpn.container" }}
- name: openvpn
  args:
    - -d
    {{- if .Values.vpn.localCIDR }}
    - -r
    - {{ .Values.vpn.localCIDR | quote }}
    {{- end }}
  image: "{{ .Values.vpn.image.openvpn.repository }}:{{ .Values.vpn.image.openvpn.tag | default "latest" }}"
  imagePullPolicy: {{ .Values.vpn.image.pullPolicy | default .Values.image.pullPolicy }}
  {{ include "transmission.vpn.livenessprobe" (.Values.vpn.connectionName | default "tun0") | nindent 2 }}
  {{ include "transmission.vpn.common" . | nindent 2 }}
  volumeMounts:
    - name: vpnconf
      mountPath: /vpn
{{- end }}
