{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-get:
  archive:
    - extracted
    - name: /tmp/alfresco
    - source: {{ salt['pillar.get']('alfresco:url') }}
    - source_hash: {{ salt['pillar.get']('alfresco:source_hash') }}
    - archive_format: zip
