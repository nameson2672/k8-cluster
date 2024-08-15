{{- define "static-app.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}
