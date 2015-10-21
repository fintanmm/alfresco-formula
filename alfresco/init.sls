{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-get:
  archive.extracted:
    - name: /tmp/
    - source: {{ salt['pillar.get']('alfresco:url') }}
    - source_hash: {{ salt['pillar.get']('alfresco:source_hash') }}
    - archive_format: zip
    - if_missing: /tmp/alfresco-community-{{ salt['pillar.get']('alfresco:version') }}
