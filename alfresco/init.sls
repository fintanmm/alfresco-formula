{% from "alfresco/map.jinja" import alfresco with context %}

alfresco-get:
  archive:
    - extracted
    - name: {{ salt['pillar.get']('alfresco:install_dir') }}
    - source: {{ salt['pillar.get']('alfresco:url') }}
    - source_hash: {{ salt['pillar.get']('alfresco:source_hash') }}
    - tar_options: z
    - archive_format: zip
    - if_missing: {{ salt['pillar.get']('alfresco:install_dir') }}/alfresco-{{ salt['pillar.get']('alfresco:version') }}/