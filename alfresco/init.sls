{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-get:
  archive:
    - extracted
    - name: /tmp
    - source: {{ salt['pillar.get']('alfresco:url') }}
    - source_hash: {{ salt['pillar.get']('alfresco:source_hash') }}
    - tar_options: z
    - archive_format: zip