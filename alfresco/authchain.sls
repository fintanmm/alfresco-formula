{% from "alfresco/map.jinja" import alfresco with context %}

{% set chain = salt['pillar.get']('alfresco:auth:chain') %}

{%- macro makeauth(chain) -%}
  {%- for method in chain -%}
    {{- "%s1:" % method -}}{{- "%s1" % method -}},
  {%- endfor%}
{%- endmacro %}

chain-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# CHAIN : salt managed zone"
    - marker_end: "# CHAIN ENDS : salt managed zone --"
    - content: |
        authentication.chain={{- makeauth(chain)[:-1] }}

include:
  {%- for method in chain -%}
    - alfresco.{{- method -}}
  {%- endfor%}  